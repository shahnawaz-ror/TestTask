# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit destroy]
  before_action :authenticate_user!

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    user = User.find_by_id(1)
    rewards = []
    in_a_month = check_if_user_has_collected_100_points_in_a_month(user)
    birthday_month = check_for_user_birthday(user)
    rewards.push(in_a_month, birthday_month)
    redirect_to user_reward_reward_list_path(user)
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:fulle_name, :email, :date_of_bith, :password)
  end

  def check_if_user_has_collected_100_points_in_a_month(user)
    @points = PointHistory.in_a_month(user)
    @user_reward = UserReward.assign_free_coffee(user) if @points.all.pluck(:earned).sum == 100
  end

  def check_for_user_birthday(user)
    @user_reward = User.birthday_this_month(user.id)
  end
end
