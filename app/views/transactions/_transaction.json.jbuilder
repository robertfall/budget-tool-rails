json.extract! transaction, :id, :description, :processed_at, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)