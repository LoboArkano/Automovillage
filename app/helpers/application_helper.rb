module ApplicationHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def categories
    category_link = []
    categories_order_by_priority.collect do |category|
      category_link.push(link_to(category.name.upcase, categories_show_path(category.id), class: 'nav-item'))
    end
    content_tag(:li) do
      category_link[0] +
        category_link[1] +
        category_link[2] +
        category_link[3] +
        category_link[4]
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
end
