json.array!(@login_audits) do |login_audit|
  json.extract! login_audit, :_id, :user_id, :cashbox_id, :startTime, :endTime,:created_at, :updated_at
end
