json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :name
  json.url achievement_url(achievement, format: :json)
end
