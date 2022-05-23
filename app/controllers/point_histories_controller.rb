# frozen_string_literal: true

class PointHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @point_histories = PointHistory.where(user_id: params[:user_id])  
  end
end
