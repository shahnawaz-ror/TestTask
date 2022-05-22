# frozen_string_literal: true

class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward
  def self.assign_free_coffee(user_id)
    @user_reward = UserReward.where(user_id: user_id, reward_id: Reward.find_by(title: 'Free Coffee').id, status: true)
    unless @user_reward.present?
      @user_reward = UserReward.create(user_id: user_id, reward_id: Reward.find_by(title: 'Free Coffee').id)
      @user_reward.update_attribute(:status, true)
    end
    @user_reward
  end

  def self.assign_free_movie(user_id)
    @user_reward = UserReward.where(user_id: user_id, reward_id: Reward.find_by(title: 'Free Movie Ticket').id,
                                    status: true)
    unless @user_reward.present?
      @user_reward = UserReward.create(user_id: user_id, reward_id: Reward.find_by(title: 'Free Movie Ticket').id)
      @user_reward.update_attribute(:status, true)
    end
    @user_reward
  end
end
