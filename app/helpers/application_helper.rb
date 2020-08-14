module ApplicationHelper

  def simple_helper
    #html_safe removes the html code out to make it a string
    #okay to not use it without input from user
    # helper used to eliminate html logic ...if, then..in the view
    # if no html is in view, it should be in helper
    "<p>Sample Helper </p>".html_safe
  end

  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path) +
        "<br>".html_safe +
        (link_to "Login", new_user_session_path)
    else
      link_to "Logout", destroy_user_session_path, method: :delete
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
end
