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

end
