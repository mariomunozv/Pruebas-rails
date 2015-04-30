json.array!(@stores) do |store|
  json.extract! store, :_id, :name, :address, :client, :comune, :cashboxes
  json.url store_url(store, format: :json)
end
