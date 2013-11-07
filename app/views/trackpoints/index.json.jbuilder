json.array!(@trackpoints) do |trackpoint|
  json.extract! trackpoint, :latitude, :longitude, :time
#  json.url device_trackpoint_url(trackpoint.device_id, trackpoint.id, format: :json)
end
