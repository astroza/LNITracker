json.array!(@busstops) do |busstop|
  json.extract! busstop, :name, :latitude, :longitude
  json.url busstop_url(busstop, format: :json)
end
