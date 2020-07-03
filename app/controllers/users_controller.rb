class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
