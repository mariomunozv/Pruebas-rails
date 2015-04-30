json.array!(@inventories) do |inventory|
  json.extract! inventory, :_id, :user_id, :store_id, :details, :created_at
  json.url inventory_url(inventory, format: :json)
end