module Jekyll
  module RemoveLazyImages

    # Removes lazy-loading setup for images to make them work in feed.
    def remove_lazy_images(text)

      text.scan(/\<img.*\/\>/).each do |image_tag|

        data_src_attr = /data-src="(.*?)"/.match(image_tag)

        if data_src_attr
          data_src = data_src_attr[1]

          new_image_tag = image_tag.sub(/ src="(.*?)"/, " src=\"#{data_src}\"")
          new_image_tag = new_image_tag.sub(/data-src="(.*?)" /, "")

          text.sub!(image_tag, new_image_tag)
        end
      end

      text
    end
  end
end

Liquid::Template.register_filter(Jekyll::RemoveLazyImages)
