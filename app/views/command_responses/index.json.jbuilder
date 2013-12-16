json.array!(@command_responses) do |command_response|
  json.extract! command_response, :response, :device_id
  json.url command_response_url(command_response, format: :json)
end
