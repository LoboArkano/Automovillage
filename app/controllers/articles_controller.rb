class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, only: %i[new create]

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
    @article = Article.find(article_id_param)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :picture)
  end

  def require_login
    return if current_user

    redirect_to sessions_log_in_path, alert: 'You must be logged in to access this section'
  end

  def article_id_param
    params[:id]
  end
end
