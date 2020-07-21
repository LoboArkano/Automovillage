module ArticlesHelper
  def show_article(article)
    art_img = cl_image_tag(article.picture.key.to_s, class: 'bg-custom-2 w-100 h-100')
    vote = get_votes(article)
    content_tag(:div, nil, class: 'article-show d-flex w-100 open-sans regular') do
      concat(content_tag(:div, art_img, class: 'article_image') +
              content_tag(:h3, article.title, class: 'article_title bold') +
              content_tag(:p, article.text, class: 'article_test') +
              content_tag(:p, "Author: #{article.author.name}", class: 'article_author') +
              vote)
    end
  end
end
