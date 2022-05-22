# frozen_string_literal: true

class BadgeHistory < ApplicationRecord
  belongs_to :badge
  belongs_to :user
  scope :available_show, lambda {
                           where(status: true)
                         }
end
