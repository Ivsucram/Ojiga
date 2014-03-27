json.array!(@feedback_users) do |feedback_user|
  json.extract! feedback_user, :id, :grade, :description
  json.url feedback_user_url(feedback_user, format: :json)
end
