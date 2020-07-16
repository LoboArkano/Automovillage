module CategoriesHelper
  def categories_order_by_priority
    Category.all.order(:priority)
  end

  def most_voted_article
    article = Article.all.order('votes_count IS NULL, votes_count desc').first
    content_tag(:article, class: "mv-article bg-custom d-flex w-100", style: "background-image: url(#{article.picture.service_url})") do
      concat(
        content_tag(:p, "#{article.title}", class: "chivo bold orange mv-title") + 
        content_tag(:p, "#{sanitize(article.text.truncate(210, separator: ' '))}", class: "lato bold white mv-text")
      )
    end
  end

  def most_recent_art_by_category(categories)
    content_tag(:div, class: "chivo bold categories-container d-flex") do
      categories.collect do |category|
        break if category.priority > 4

        article = category.articles.order(created_at: :desc).first
        if article != nil
          concat(
            content_tag(:article,
                        content_tag(:p, link_to("#{category.name}", categories_show_path(category), class: "category-name"), class: 'category') + 
                        content_tag(:p, "#{article.title}", class: "article-title"),
                        class: 'mr-article bg-custom d-flex',
                        style: "background-image: url(#{article.picture.service_url})")
          )
        end
      end
    end
  end

  def most_recent_articles(category, articles)
    content_tag(:div, class: "articles-container d-flex") do
      articles.collect do |article|
        if current_user
          if article.votes.where(:user_id => session[:user_id], :article_id => article.id).size.zero?
            vote = content_tag(:p, link_to("#{article.votes.size} - Add Vote", votes_create_path(article), class: "vote orange"), class: 'chivo regular art-vote')
          else
            vote = content_tag(:p, link_to("#{article.votes.size} - Remove Vote", votes_destroy_path(article), class: "vote gray"), class: 'chivo regular art-vote')
          end
        end
        concat(
          content_tag(:article,
                      content_tag(:div, cl_image_tag("#{article.picture.key}", class: "bg-custom-2 w-100 h-100"), class: "img-container") + 
                      content_tag(:div,
                                  content_tag(:p, link_to("#{category.name}",  categories_show_path(category), class: "category-link orange"), class: "open-sans bold art-category-name") + 
                                  content_tag(:p, "#{article.title}", class: "open-sans bold art-title") + 
                                  content_tag(:p, "#{sanitize(article.text.truncate(200, separator: ' '))}", class: "lato regular art-text") + 
                                  content_tag(:p, "Author: #{article.author.name}", class: "chivo regular art-author") + 
                                  vote,
                                  class: "art-info d-flex"),
                      class: "article-container light-gray-bg d-flex")
        )
      end
    end
  end
end
