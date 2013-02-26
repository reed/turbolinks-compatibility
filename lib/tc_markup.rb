require 'redcarpet'
require 'cgi'

class TCMarkup < Redcarpet::Render::HTML
  def block_code(code, language)
    "<pre><small class=\"language-label muted pull-right\">#{language.upcase if language}</small>" +
    "<code class=\"language-#{language}\">#{CGI::escapeHTML(code)}</code></pre>"
  end
  
  def header(text, header_level)
    output = "<h#{header_level}>#{text}</h#{header_level}>"
    if header_level == 1
      output = "<div class=\"hero-unit\">#{output + social_plugins}</div>"
    end 
    output
  end

  private
  
  def social_plugins
    "<div class=\"social-plugins\">#{like_button + tweet_button}</div>"
  end
  
  def tweet_button
    "<a href=\"https://twitter.com/share\" class=\"twitter-share-button\" data-url=\"http://reed.github.com/turbolinks-compatibility\" data-text=\"Turbolinks Compatibility\" data-hashtags=\"turbolinks\" data-dnt=\"true\">Tweet</a>"
  end
  
  def like_button
    "<div class=\"fb-like\" data-send=\"true\" data-layout=\"button_count\" data-show-faces=\"false\"></div>"
  end
end
