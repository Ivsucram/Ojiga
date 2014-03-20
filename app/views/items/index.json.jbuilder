json.array!(@items) do |item|
  json.extract! item, :id, :name, :picture, :description, :rentUnitPrice, :unitTime, :minimumRentingTime, :maximumRentingTime, :totalValue, :isAvailable
  json.url item_url(item, format: :json)
end
