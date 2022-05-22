# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :price, :user_id
  geocoded_by latitude: :latitude, longitude: :longitude
  validate :generate_points_based_on_location

  scope :in_a_60_days, lambda { |user_id|
                         where(created_at: Time.now.beginning_of_month..Time.now + 60.days, user_id: user_id)
                       }

  def generate_points_based_on_location
    latitude = self.latitude
    longitude = self.longitude
    latitude_longitude = "#{latitude},#{longitude}"
    response = Geocoder.search(latitude_longitude).first
    if response.data['error'].present?
      errors.add(:base, response.data['error'])
    elsif response.data['address']['country'] == 'Singapore'
      if price.to_i >= 100
        PointHistory.create(earned: 10, location: response.data['address']['country'], user_id: user_id)
      end
    else
      PointHistory.create(earned: 10 * 2, location: response.data['address']['country'], user_id: user_id)
    end
  end
end
