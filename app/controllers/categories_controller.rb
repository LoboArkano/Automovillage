class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all.order(:priority)
  end

  def show
    @category = Category.find(params[:format])
    @articles = @category.articles.order(created_at: :desc)
  end
end
