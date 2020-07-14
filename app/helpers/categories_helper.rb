module CategoriesHelper
  def categories_order_by_priority
    Category.all.order(:priority)
  end

  def most_voted_article
    article = Article.all.order('votes_count IS NULL, votes_count desc').first
    content_tag(:article, class: "mv-article bg-custom d-flex w-100", style: "background-image: url(#{article.picture.service_url})") do
      concat(
        content_tag(:p, "#{article.title}", class: "mv-title") + 
        content_tag(:p, "#{article.text}", class: "mv-text")
      )
    end
  end

  def most_recent_art_by_category(categories)
    content_tag(:div, class: "categories-container d-flex") do
      categories.collect do |category|
        break if category.priority > 4

        article = category.articles.order(created_at: :desc).first
        if article != nil
          concat content_tag(:article,
                              content_tag(:p, link_to("#{category.name}", categories_show_path(category), class: "category-name")) + 
                              content_tag(:p, "#{article.title}", class: "article-title"),
                              class: 'mr-article bg-custom d-flex',
                              style: "background-image: url(#{article.picture.service_url})")
        end
      end
    end
  end
end
