json.array!(@bus_stops) do |bus_stop|
  json.extract! bus_stop, :name, :latitude, :longitude
  json.url bus_stop_url(bus_stop, format: :json)
end
