json.array!(@clients) do |client|
  json.extract! client, :_id, :name
  json.url store_url(client, format: :json)
end
