json.array!(@decreases) do |decrease|
  json.extract! decrease, :_id, :user_id, :store_id, :details, :created_at, :comment
  json.url inventory_url(decrease, format: :json)
end