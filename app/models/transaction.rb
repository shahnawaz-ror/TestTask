class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :price, :user_id
end
