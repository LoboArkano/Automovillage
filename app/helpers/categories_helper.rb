module CategoriesHelper
  def categories_order_by_priority
    Category.all.order(:priority)
  end

  def most_voted_article
    article = Article.all.order('votes_count IS NULL, votes_count desc').first
    content_tag(:article, class: "mv-article d-flex w-100", style: "background-image: url(#{article.picture.service_url})") do
      concat content_tag(:p, "#{article.title}", class: "mv-title") + content_tag(:p, "#{article.text}", class: "mv-text")
    end
  end
end
