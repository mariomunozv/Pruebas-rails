json.array!(@products) do |product|
  json.extract! product, :id, :barcode, :brand, :name, :content, :unit, :price, :price_net, :tax_id, :client_id
  json.url product_url(product, format: :json)
end
