module Jekyll
  module ImageFilter

    def image(url, eager = false)
      small_url = url.sub(/([^.]+)/, '\0_small')

      site_url = @context.registers[:site].config['url']

      # could be useful
      # page_url = @context.registers[:page]['url']

      url = "#{site_url}#{url}"
      small_url = "#{site_url}#{small_url}"

      output = "<a href='#{url}'>"
      if eager
        output += "<img src='#{small_url}' />"
      else
        output += "<img src='#{site_url}/img/loader.gif' data-src='#{small_url}' />"
      end
      output += "</a>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageFilter)
