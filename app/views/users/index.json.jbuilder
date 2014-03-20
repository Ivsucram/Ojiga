json.array!(@users) do |user|
  json.extract! user, :id, :name, :nick, :email, :birthday, :picture, :isTermConditionsChecked
  json.url user_url(user, format: :json)
end
