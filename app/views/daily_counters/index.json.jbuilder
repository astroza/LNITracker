json.array!(@daily_counters) do |daily_counter|
  json.extract! daily_counter, :id, :device_id, :date, :counter
  json.url daily_counter_url(daily_counter, format: :json)
end
