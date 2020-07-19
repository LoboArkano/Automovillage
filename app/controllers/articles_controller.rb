class ArticlesController < ApplicationController
  include ArticlesHelper

  def new
    @article = Article.new
  end

  def create
    user = User.find(current_user.id)
    @article = user.articles.new(article_params)
    if @article.save
      params[:category_ids].each do |category_id|
        Tagging.create(article_id: @article.id,
                       category_id: category_id)
      end
      redirect_to root_path, notice: 'Share your article!'
    else
      redirect_to new_article_path, alert: @article.errors.full_messages
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :picture)
  end
end
