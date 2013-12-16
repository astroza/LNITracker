json.array!(@pending_commands) do |pending_command|
  json.extract! pending_command, :command, :device_id
  json.url pending_command_url(pending_command, format: :json)
end
