json.array!(@feedback_items) do |feedback_item|
  json.extract! feedback_item, :id, :grade, :description
  json.url feedback_item_url(feedback_item, format: :json)
end
