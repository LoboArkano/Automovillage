class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(:author_id => session[:user_id],
                            :title => params[:title],
                            :text => params[:text],
                            :image => "string")
    if @article.save
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
end
