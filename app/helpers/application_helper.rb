module ApplicationHelper

  def simple_helper
    #html_safe removes the html code out to make it a string
    #okay to not use it without input from user
    # helper used to eliminate html logic ...if, then..in the view
    # if no html is in view, it should be in helper
    "<p>Sample Helper </p>".html_safe
  end

  # handle if no style if passed (no layout)
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
        "".html_safe +
        (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def sample_helper
    content_tag('div', "My Content", class: "some-class")
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you're on the #{layout_name} layout", class: "source-class")
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      { url: about_me_path,
        title: 'About Me'
      },
      { url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      { url: portmanteaus_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
  
    nav_links.html_safe

  end

  def orig_nav_helper style, tag_type
    nav_links =<<NAV
<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About Me</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{tag_type}>
<#{tag_type}><a href="#{portmanteaus_path}" class="#{style} #{active? portmanteaus_path}">Portfolio</a></#{tag_type}>
NAV

  nav_links.html_safe
  end

  # current_page is rails method of confirming path
  def active? path
   "active" if current_page? path
  end

 # does not work with flash error messages, see generator 
  def alerts
    alert = ( flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
      # js add_gritter(alert, title: "Please alert this!", sticky: false)
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Matt Zickel Portfolio!", sticky: false)
  end

end
