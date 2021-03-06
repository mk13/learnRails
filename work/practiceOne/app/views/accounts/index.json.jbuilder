json.array!(@accounts) do |account|
  json.extract! account, :id, :user_id, :account_number, :balance
  json.url account_url(account, format: :json)
end
