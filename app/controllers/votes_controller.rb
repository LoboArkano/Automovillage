class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(:user_id => session[:user_id], :article_id => params[:format])

    if @vote.save
      redirect_to root_path
    else
    end
  end

  def destroy
    @vote = Vote.find_by(:user_id => session[:user_id], :article_id => params[:format])

    if @vote.destroy
      redirect_to root_path
    end
  end
end
