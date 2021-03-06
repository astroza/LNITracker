#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'
require 'date'

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

# Report: /^>REV(\d{2})(\d{4})(\d)(\d{5})([\+|\-]\d{7})([\+|\-]\d{8})(\d{3})(\d{3})(\d)(\d)(\S*)<$/

class Server < EventMachine::Connection
	attr_accessor :status, :device

	def send_pending_commands
		PendingCommand.where(:device_id => @device.id, :sent => false).each do |pc|
			send_data(pc.command)
			pc.sent = true
			pc.save
		end
	end

	def unbind
		if @device != nil
			@device.connections -= 1
			@device.save
		end
	end

	def receive_data(data)
		if @status == :OK
			send_pending_commands
			matches = /^>REV(\d{2})(\d{4})(\d)(\d{5})([\+|\-]\d{7})([\+|\-]\d{8})(\d{3})(\d{3})(\d)(\d)(\S*)</.match(data)
			if matches != nil and matches.size >= 12
				# Se trata de un reporte
				event_idx = matches[1]
				weeks = matches[2].to_i
				day = matches[3].to_i
				time = matches[4].to_f
				latitude = Float(matches[5])/100000.0
				longitude = Float(matches[6])/100000.0
				velocity = Float(matches[7])*1.609344
				heading = matches[8]
				fix_mode = matches[9]
				age = matches[10]
				extended = matches[11]
				datetime = DateTime.new(1980, 1, 6, 0, 0, 0, "00:00")
				datetime += 7*weeks
				datetime += day
				datetime += time/(24*3600)
				@device.trackpoints.create(:latitude => latitude, :longitude => longitude, :velocity => velocity, :time => datetime)
			else
				CommandResponse.create(:device_id => @device.id, :response => data.force_encoding('Windows-1252').encode('UTF-8'))
			end
			# ACK
			send_data(@device.identifier)
		else
			matches = /^>RXART;(\S+);ID=(\d+)</.match(data)
			imei = matches[2] if matches != nil
			if imei != nil
				device = Device.where(:identifier => imei).first
				if device != nil
					@device = device
					@status = :OK
					send_pending_commands
					@device.connections += 1
					@device.save
					# ACK
					send_data(@device.identifier)
				else
					close_connection
				end
			else
				close_connection
			end
		end
	end
end

EM.run do
  Signal.trap("TERM") { EM.stop }
  EM.start_server '0.0.0.0', 1140, Server do |conn|
    conn.status = :NO_ID
	  conn.device = nil
	  conn.comm_inactivity_timeout = 60
  end
end

