json.array!(@taxes) do |tax|
  json.extract! tax, :id, :name, :value, :client_id
  json.url tax_url(tax, format: :json)
end
