json.array!(@products) do |product|
  json.extract! product, :id, :productID, :category, :product_name, :price
  json.url product_url(product, format: :json)
end
