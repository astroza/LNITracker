require 'rubygems'
require 'eventmachine'
require 'date'

ENV['RAILS_ENV'] = "development"
require '../../config/environment.rb'

class Server < EventMachine::Connection
    attr_accessor :options, :status, :timer

    def receive_data(data)
        puts "#{@status} -- #{data}"
        send_data("helo\n")
    end
end

EM.run do
    EM.start_server 'localhost', 8080, Server do |conn|
        conn.options = {:my => 'options'}
        conn.status = :OK
	conn.comm_inactivity_timeout = 5
    end
end
