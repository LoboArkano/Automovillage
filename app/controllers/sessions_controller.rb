class SessionsController < ApplicationController
  def new; end

  def create
    @user_temp = User.find_by(name: input_name)

    if @user_temp
      session[:user_id] = @user_temp.id
      session[:username] = @user_temp.name

      redirect_to root_path, notice: 'Login completed'

    else
      redirect_to sessions_log_in_path, alert: 'This name does not exist'
    end
  end

  def log_in
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil

    redirect_to root_path
  end

  private

  def input_name
    params[:username_login]
  end
end
