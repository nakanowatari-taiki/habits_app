class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @plans = current_user.plans.order("created_at DESC")
  end
end
