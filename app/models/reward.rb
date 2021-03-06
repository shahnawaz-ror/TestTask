# frozen_string_literal: true

class Reward < ApplicationRecord
  validates_presence_of :title
  validates :title, uniqueness: true
end
