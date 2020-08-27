module ApplicationHelper

  def login_helper style, needs_br=false
    if current_user.is_a?(GuestUser)
      if needs_br
        (link_to "register", new_user_registration_path, class: style + " animsition-link") + "<br>".html_safe +
        (link_to "login", new_user_session_path, class: style + " animsition-link")
      else  
        (link_to "register", new_user_registration_path, class: style + " animsition-link") + " ".html_safe +
        (link_to "login", new_user_session_path, class: style + " animsition-link") 
      end
    else  
      link_to "logout", destroy_user_session_path, method: :delete, class: style  
    end 
  end

  def source_helper(styles)
    # Here is the follow up for the session variable code from the set_source concern in controllers/concerns
     if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to "contact me", contact_path} if you'd like to work together!"
      content_tag(:div, greeting.html_safe, class: styles)
     end 
  end

  def copyright_helper
    CampbellViewTool::Renderer.copyright 'Bradley Campbell |', 'All rights reserved'
  end

  def nav_items 
   nav_items = [
      {
        url: root_path,
        title: 'home'
      },
            {
        url: resume_path,
        title: 'experience'
      },
      #       {
      #   url: portfolios_path,
      #   title: 'portfolio'
      # }, 
            {
        url: about_me_path,
        title: 'about-me'
      },
      #       {
      #   url: tech_news_path,
      #   title: 'tech-news'
      # },
            {
        url: blogs_path,
        title: 'blog'
      },
            {
        url: contact_path,
        title: 'contact'
      },
    ]

    resume_items = {url: resume_items_path, title: "resume_items"}
    nav_items << resume_items if logged_in?(:site_admin)

    nav_items
  end

  def this_url? string
    url = request.path_info
    true if url.include? string
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path 
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, :title => "Bradley Campbell Portfolio", :sticky => false, :time => 1000)
  end
end