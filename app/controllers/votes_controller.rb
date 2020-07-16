class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(:user_id => session[:user_id], :article_id => params[:format])

    if @vote.save
      redirect_to request.referrer
    else
    end
  end

  def destroy
    @vote = Vote.find_by(:user_id => session[:user_id], :article_id => params[:format])

    if @vote.destroy
      redirect_to request.referrer
    end
  end
end
