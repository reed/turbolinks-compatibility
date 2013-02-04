require 'redcarpet'
require 'cgi'

class TCMarkup < Redcarpet::Render::HTML
  def block_code(code, language)
    "<pre><small class=\"language-label muted pull-right\">#{language.upcase if language}</small>" +
    "<code class=\"language-#{language}\">#{CGI::escapeHTML(code)}</code></pre>"
  end
  
  def header(text, header_level)
    output = "<h#{header_level}>#{text}</h#{header_level}>"
    output = "<div class=\"hero-unit\">#{output}</div>" if header_level == 1
    output
  end
end
