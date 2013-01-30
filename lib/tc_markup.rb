require 'redcarpet'
require 'cgi'

class TCMarkup < Redcarpet::Render::HTML
  def block_code(code, language)
    "<pre><code class=\"language-#{language}\">#{CGI::escapeHTML(code)}</code></pre>"
  end
  
  def header(text, header_level)
    output = "<h1>#{text}</h1>"
    output = "<div class=\"hero-unit\">#{output}</div>" if header_level == 1
    output
  end
end
