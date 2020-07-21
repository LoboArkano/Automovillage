class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(user_id: current_user.id, article_id: article_id_param)

    redirect_to request.referrer if @vote.save
  end

  def destroy
    @vote = Vote.find_by(user_id: current_user.id, article_id: article_id_param)

    redirect_to request.referrer if @vote.destroy
  end

  private

  def article_id_param
    params[:format]
  end
end
