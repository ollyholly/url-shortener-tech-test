# frozen_string_literal: true

require 'base64'

class UrlHandler
  @links = {}

  def self.shorten(original_url)
    validated_url = handle_prefix(original_url)
    short_url = encode(validated_url)
    @links[short_url] = validated_url
    { short_url: short_url, url: validated_url }
  end

  def self.find(short_url)
    { url: @links[short_url] }
  end

  def self.handle_prefix(link)
    if link[0..6] != 'http://' && link[0..7] != 'https://'
      return 'http://' + link
    end

    link
  end

  def self.encode(link)
    Base64.encode64(link)[0..5]
  end
end
