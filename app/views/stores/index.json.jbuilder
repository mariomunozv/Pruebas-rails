json.array!(@stores) do |store|
  json.extract! store, :id, :name, :address, :comune, :region, :client_id
  json.url store_url(store, format: :json)
end
