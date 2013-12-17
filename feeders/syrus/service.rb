require 'rubygems'
require 'eventmachine'
require 'date'

ENV['RAILS_ENV'] = "development"
require '../../config/environment.rb'

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
				weeks = matches[2]
				day = matches[3]
				time = matches[4]
				latitude = Float(matches[5])/100000.0
				longitude = Float(matches[6])/100000.0
				velocity = Float(matches[7])*1.609344
				heading = matches[8]
				fix_mode = matches[9]
				age = matches[10]
				extended = matches[11]
				@device.trackpoints.create(:latitude => latitude, :longitude => longitude, :velocity => velocity, :time => Time.now)
			end
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
				end
			else
				close_connection
			end
		end
	end
end

EM.run do
    EM.start_server '0.0.0.0', 1140, Server do |conn|
        conn.status = :NO_ID
	conn.device = nil
	conn.comm_inactivity_timeout = 60
    end
end
