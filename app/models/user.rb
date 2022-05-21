# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions
  has_many :points
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  validates_presence_of :fulle_name, :date_of_bith
  def self.birthday_this_month(user_id)
    user = User.find(user_id)
    @user_reward = UserReward.where(user_id: user_id, reward_id: Reward.find_by(title: '5% Cash Rebate').id,
                                    status: true)
    if !@user_reward.present? && (user.date_of_bith.strftime('%m') == Date.today.strftime('%m'))
      @user_reward = UserReward.create(user_id: user_id, reward_id: Reward.find_by(title: '5% Cash Rebate').id)
      @user_reward.update_attribute(:status, true)
    end
    @user_reward
  end
end
