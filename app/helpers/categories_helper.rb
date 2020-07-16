module CategoriesHelper
  def categories_order_by_priority
    Category.all.order(:priority)
  end

  def most_voted_article
    article = Article.all.order('votes_count IS NULL, votes_count desc').first
    if article
      cl_img = "background-image: url(#{article.picture.service_url})"
      content_tag(:article, class: 'mv-article bg-custom d-flex w-100', style: cl_img) do
        concat(
          content_tag(:p, article.title.to_s, class: 'chivo bold orange mv-title') +
          content_tag(:p, sanitize(article.text.truncate(210, separator: ' ')).to_s, class: 'lato bold white mv-text')
        )
      end
    end
  end

  def most_recent_art_by_category(categories)
    content_tag(:div, class: 'chivo bold categories-container d-flex') do
      categories.collect do |category|
        break if category.priority > 4

        article = category.articles.order(created_at: :desc).first
        next if article.nil?

        link_category_name = link_to(category.name.to_s, categories_show_path(category), class: 'category-name')
        category_name = content_tag(:p, link_category_name, class: 'category')

        concat(
          content_tag(:article,
                      category_name +
                      content_tag(:p, article.title.to_s, class: 'article-title'),
                      class: 'mr-article bg-custom d-flex',
                      style: "background-image: url(#{article.picture.service_url})")
        )
      end
    end
  end

  def most_recent_articles(category, articles)
    content_tag(:div, class: 'articles-container d-flex') do
      articles.collect do |article|
        cl_img = cl_image_tag(article.picture.key.to_s, class: 'bg-custom-2 w-100 h-100')
        category_link = link_to(category.name.to_s, categories_show_path(category), class: 'category-link orange')
        art_text = sanitize(article.text.truncate(200, separator: ' ')).to_s
        if current_user
          vote_link = if article.votes.where(user_id: session[:user_id], article_id: article.id).size.zero?
                        link_to("#{n_votes(article)} - Add Vote", votes_create_path(article), class: 'vote orange')
                      else
                        link_to("#{n_votes(article)} - Remove Vote", votes_destroy_path(article), class: 'vote gray')
                      end
          vote = content_tag(:p, vote_link, class: 'chivo regular art-vote')
        else
          vote = content_tag(:p, "#{n_votes(article)} Vote(s)", class: 'chivo regular art-vote orange')
        end
        concat(
          content_tag(:article,
                      content_tag(:div, cl_img, class: 'img-container') +
                      content_tag(:div,
                                  content_tag(:p, category_link, class: 'open-sans bold art-category-name') +
                                  content_tag(:p, article.title.to_s, class: 'open-sans bold art-title') +
                                  content_tag(:p, art_text, class: 'lato regular art-text') +
                                  content_tag(:p, "Author: #{article.author.name}", class: 'chivo regular art-author') +
                                  vote,
                                  class: 'art-info d-flex'),
                      class: 'article-container light-gray-bg d-flex')
        )
      end
    end
  end

  def n_votes(article)
    article.votes.size
  end
end
