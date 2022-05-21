json.extract! transaction, :id, :initiate_date, :latitude, :longitude, :price, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
