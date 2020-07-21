class CategoriesController < ApplicationController
  include CategoriesHelper

  def new
    @category = Category.new
  end

  def index
    @categories = categories_order_by_priority
  end

  def show
    Rails.logger.debug params.inspect
    @category = Category.find(category_id)
    @articles = most_recent_articles_from_category(@category)
  end

  private

  def category_id
    params[:format]
  end
end
