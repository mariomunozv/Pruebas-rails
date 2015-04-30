json.array!(@decreases) do |decrease|
  json.extract! decrease, :id, :user_id, :details, :store_id
  json.url decrease_url(decrease, format: :json)
end
