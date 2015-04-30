json.array!(@products) do |product|
  json.extract! product, :_id, :barcode, :brand, :name, :content, :unit, :price, :price_net 
  json.url store_url(product, format: :json)
end
