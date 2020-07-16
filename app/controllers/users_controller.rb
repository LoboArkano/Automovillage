class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to sessions_log_in_path, notice: 'Your account has been created!'
    else
      redirect_to new_user_path, alert: @user.errors.full_messages
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
