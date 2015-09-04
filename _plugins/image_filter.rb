module Jekyll
  module ImageFilter

    # def image(file, eager = false, link = true)
    def image(file, *args)
      eager = args.include?('eager')
      link = !args.include?('nolink')

      page_url = @context.registers[:page]['url']

      url = "/img#{page_url}/#{file}"

      small_url = url.sub(/([^.]+)/, '\0_small')

      if !File.exist?(small_url)
        small_url = url
      end

      output = ""

      if link
        output = "<a href='#{url}'>"
      end

      if eager
        output += "<img src='#{small_url}' />"
      else
        output += "<img src='/img/loader.gif' data-src='#{small_url}' />"
      end

      if link
        output += "</a>"
      end

      puts "#{page_url}: #{link}"

      output
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageFilter)
