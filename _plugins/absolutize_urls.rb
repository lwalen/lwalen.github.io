module Jekyll
  module AbsolutizeUrls

    def absolutize_urls(text)

      site_url = @context.registers[:site].config['url']

      text.gsub(/\="\//, "=\"#{site_url}/")
    end
  end
end

Liquid::Template.register_filter(Jekyll::AbsolutizeUrls)
