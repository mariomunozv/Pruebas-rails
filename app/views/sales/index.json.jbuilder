json.array!(@sales) do |sale|
  json.extract! sale, :_id, :user_id, :details, :total, :created_at, :updated_at, :cash, :card, :isValid
  json.url sale_url(sale, format: :json)
end
