#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

def insert_trackpoint(device_id, msg)
	matches = /POINT \((-?\d+\.\d+)\s(-?\d+\.\d+)\)/.match(msg['lonlat'])
	longitude = matches[1].to_f
	latitude = matches[2].to_f
	print longitude, latitude
	Trackpoint.create(:device_id => device_id, :longitude => longitude, :latitude => latitude, :velocity => msg['velocity'], :time => msg['gps_time'])
end

EM.run {
  Signal.trap("TERM") { EM.stop }
  client = Faye::Client.new('http://localhost:9595/push')

  client.subscribe('/device_trackpoints/1') do |message|
    puts message.inspect
    insert_trackpoint(3, message)
  end

  client.subscribe('/device_trackpoints/2') do |message|
    puts message.inspect
    insert_trackpoint(1, message)
  end
}
