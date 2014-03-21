json.array!(@logs) do |log|
  json.extract! log, :id, :description
  json.url log_url(log, format: :json)
end
