# frozen_string_literal: true

class UpdatePointsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later
    User.all.each do |user|
      rewards = []
      in_a_month = check_if_user_has_collected_100_points_in_a_month(user)
      birthday_month = check_for_user_birthday(user)
      check_spent = check_if_user_1000_spend(user)
      rewards.push(in_a_month, birthday_month, check_spent)
    end
  end

  def check_if_user_has_collected_100_points_in_a_month(user)
    @points = PointHistory.in_a_month(user)
    @user_reward = UserReward.assign_free_coffee(user.id) if @points.all.pluck(:earned).sum == 100
  end

  def check_if_user_1000_spend(user)
    @transactions = Transaction.in_a_60_days(user)
    @user_reward = UserReward.assign_free_movie(user.id) if @transactions.all.pluck(:price).sum >= 110
  end

  def check_for_user_birthday(user)
    @user_reward = User.birthday_this_month(user.id)
  end
end
