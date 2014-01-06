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
			matches = /^\+....:GT...,[0-9a-fA-F]{6},(\d{15}),.*,(\d*),(\d+.\d),(\d+),(-?\d+\.\d),(-?\d+\.\d+),(-?\d+\.\d+),(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2}),.*\$/.match(data)
			if matches != nil and matches.size >= 13
				# Se trata de un reporte
				imei = matches[1]
				latitude = Float(matches[7])
				longitude = Float(matches[6])
				velocity = Float(matches[3])
				elevation = Float(matches[5])
				heading = matches[4]
				accuracy = matches[2]
				time = Time.new(matches[8].to_i, matches[9].to_i, matches[10].to_i, matches[11].to_i, matches[12].to_i, matches[13].to_i, "-04:00")
				@device.trackpoints.create(:latitude => latitude, :longitude => longitude, :velocity => velocity, :elevation => elevation, :time => time)
			end
		else
			matches = /^\+ACK:GTHBD,[0-9a-fA-F]{6},(\d{15}),.*,\d{14},.*\$/.match(data)
			imei = matches[1] if matches != nil
			if imei != nil
				device = Device.where(:identifier => imei).first
				if device != nil
					@device = device
					@status = :OK
					send_pending_commands
					@device.connections += 1
					@device.save
				end
			else
				close_connection
			end
		end
	end
end

$running = true
Signal.trap("TERM") do 
  $running = false
end


EM.run do
  Signal.trap("TERM") { EM.stop }
  EM.start_server '0.0.0.0', 2224, Server do |conn|
    conn.status = :NO_ID
	  conn.device = nil
	  conn.comm_inactivity_timeout = 60
  end
end

