# frozen_string_literal: true

class PointHistory < ApplicationRecord
  belongs_to :user, optional: true
  scope :in_a_month, lambda { |user_id|
                       where(created_at: Time.now.beginning_of_month..Time.now.end_of_month, user_id: user_id)
                     }
end
