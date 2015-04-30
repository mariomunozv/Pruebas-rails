json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :client_id
  json.url tag_url(tag, format: :json)
end
