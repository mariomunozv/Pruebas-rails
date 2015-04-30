json.array!(@users) do |user|
  json.extract! user, :_id, :name, :lastname, :email, :encrypted_password, :client, :role
  json.url store_url(user, format: :json)
end
