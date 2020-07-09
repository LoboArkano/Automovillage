class ArticlesController < ApplicationController
  include ArticlesHelper

  def new
    @article = Article.new
  end

  def create
    user = User.find(session[:user_id])
    Rails.logger.debug user.inspect
    @article = user.articles.build(article_params)
    # @article = Article.new(:author_id => current_user.id,
    #                         :title => params[:title],
    #                         :text => params[:text],
    #                         :image => params[:image])
    Rails.logger.debug @article.inspect
    if @article.valid?
      @article.save
      params[:category_ids].each do |category_id|
        Tagging.create(:article_id => @article.id,
                        :category_id => category_id)
      end
      redirect_to root_path
    end
  end

  def index
    @articles = Article.all
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
