json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :user_id, :details, :store_id
  json.url inventory_url(inventory, format: :json)
end
