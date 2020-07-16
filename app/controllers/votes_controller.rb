class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(user_id: session[:user_id], article_id: params[:format])

    redirect_to request.referrer if @vote.save
  end

  def destroy
    @vote = Vote.find_by(user_id: session[:user_id], article_id: params[:format])

    redirect_to request.referrer if @vote.destroy
  end
end
