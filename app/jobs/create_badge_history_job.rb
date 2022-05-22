# frozen_string_literal: true

class CreateBadgeHistoryJob < ApplicationJob
  queue_as :default
  def perform(*_args)
    User.all.each do |user|
      create_new_history(user)
    end
  end

  def create_new_history(user)
    badge_can = check_can_assigned(user)
    check_badge = user.badge_histories.joins(:badge).find_by('badges.title = ?', badge_can).present?
    add_new_history(user, badge_can) unless check_badge
  end

  def add_new_history(user, badge)
    user.badge_histories.update_all(status: false)
    user.badge_histories.create(badge_id: Badge.find_by(title: badge).id)
  end

  def check_can_assigned(user)
    counts = user.point_histories.sum(:earned)
    if counts.zero? || (counts <= 999)
      data = 'standard'
    elsif counts >= 1000 && counts <= 4999
      data = 'gold'
    elsif counts >= 5000
      data = 'platinum'
    end
    data
  end
end
