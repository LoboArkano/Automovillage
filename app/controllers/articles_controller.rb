class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(:author_id => sessions[:user_id],
                            :title => params[:title],
                            :text => params[:text],
                            :image => "string")
    if @article.save
      redirect_to root_path
    end
  end

  def index
    @articles = Article.all
  end
end
