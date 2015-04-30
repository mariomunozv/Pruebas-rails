json.array!(@cash_registers) do |cash_register|
  json.extract! cash_register, :_id, :user_id, :cashbox_id, :amount, :type, :created_at
  json.url cash_register_url(cash_register, format: :json)
end
