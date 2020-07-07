class CategoriesController < ApplicationController
  include CategoriesHelper

  def new
    @category = Category.new
  end

  def index
    @categories = categories_order_by_priority
  end

  def show
    @category = Category.find(params[:format])
    @articles = @category.articles.order(created_at: :desc)
  end
end
