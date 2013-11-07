json.array!(@devices) do |device|
  json.extract! device, :name, :identifier, :vehicle_plate
  json.url device_url(device, format: :json)
end
