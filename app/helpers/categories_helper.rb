module CategoriesHelper
  def categories_order_by_priority
    Category.all.order(:priority)
  end
end
