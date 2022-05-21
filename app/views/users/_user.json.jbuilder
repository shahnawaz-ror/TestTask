# frozen_string_literal: true

json.extract! user, :id, :fulle_name, :email, :date_of_bith, :created_at, :updated_at
json.url user_url(user, format: :json)
