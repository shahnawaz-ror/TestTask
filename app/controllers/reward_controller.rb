# frozen_string_literal: true

class RewardController < ApplicationController
  before_action :authenticate_user!
  def reward_list
    @reward_list = UserReward.all
  end
end
