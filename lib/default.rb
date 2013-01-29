# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'redcarpet'
require 'cgi'

class HTMLwithLanguage < Redcarpet::Render::HTML
  def block_code(code, language)
    "<pre><code class=\"language-#{language}\">#{CGI::escapeHTML(code)}</code></pre>"
  end
end
