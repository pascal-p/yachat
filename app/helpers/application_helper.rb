module ApplicationHelper

  #
  # do replacement for ENV vars + call to html_safe
  #
  def env_res(str)
    loop do
      if str =~ /ENV\[.(\w+).\]/
        str.sub!(/ENV\[.\w+.\]/, (ENV[$1] || ""))
      else
        break
      end
    end
    str.html_safe()
  end

  def canonical_app_title
    "#{ENV['MY_APP_NAME']}"
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = canonical_app_title
    if page_title.empty?
      base_title
    else
      " #{page_title} | #{base_title}"
    end
  end

  def link_about
  end

  def link_home
    raw %Q{<li> #{link_to(" Home", root_path, class: "glyphicon glyphicon-home")} </li>}
  end

  def link_profile
    raw %Q{<li> #{link_to("Profile", profile_path, class: "glyphicon")} </li>}
  end

  def link_chatrooms
    raw %Q{<li> #{link_to('Chatrooms', chatrooms_path, class: "glyphicon")} </li>}
  end

  #
  # keep raw, but sanitize label if using translation
  #
  def link_logout
    raw %Q{<li> #{link_to(' Log out', logout_path, method: :delete, class: "glyphicon glyphicon-log-out")} </li>}
  end

  def link_login
    raw %Q{<li> #{link_to(' Log in', login_path, class: "glyphicon glyphicon-log-in")} </li>}
  end

  def link_signup
    raw %Q{<li> #{link_to('Sign up', signup_path, class: "glyphicon")} <li>}
  end

end
