module ApplicationHelper
  def current_user
    if user_id
      @current_user ||= User.find(user_id)
    else
      @current_user = nil
    end
  end

  def user_id
    session[:user_id]
  end

  def categories
    category_links = []
    categories_obj = categories_order_by_priority
    return if categories_obj.empty?

    categories_obj.collect do |category|
      category_links.push(link_to(category.name.upcase, categories_show_path(category.id), class: 'nav-item'))
    end
    (0...category_links.length).each do |c_link|
      concat(content_tag(:li, category_links[c_link]))
      break if c_link == category_links.length - 1
    end
  end

  def user_options
    if current_user
      content_tag(:li, link_to('CREATE ARTICLE', new_article_path, class: 'nav-item')) +
        content_tag(:li, link_to(current_user.name.upcase, root_path, class: 'nav-item')) +
        content_tag(:li, link_to('LOGOUT', sessions_destroy_path, class: 'nav-item'))
    else
      content_tag(:li, link_to('LOGIN', sessions_log_in_path, class: 'nav-item')) +
        content_tag(:li, link_to('REGISTER', new_user_path, class: 'nav-item'))
    end
  end

  def search_notice
    content_tag(:div, show_message(notice), class: 'notice') if notice.present?
  end

  def search_alert
    content_tag(:div, show_message(alert), class: 'alert') if alert.present?
  end

  def show_message(message)
    content_tag(:p, message)
  end

  def get_votes(article)
    if current_user
      vote_link = if article.votes.where(user_id: user_id, article_id: article.id).size.zero?
                    link_to("#{n_votes(article)} - Add Vote", votes_create_path(article), class: 'vote orange')
                  else
                    link_to("#{n_votes(article)} - Remove Vote", votes_destroy_path(article), class: 'vote gray')
                  end
      vote = content_tag(:p, vote_link, class: 'chivo regular art-vote')
    else
      vote = content_tag(:p, "#{n_votes(article)} Vote(s)", class: 'chivo regular art-vote orange')
    end
    vote
  end
end
