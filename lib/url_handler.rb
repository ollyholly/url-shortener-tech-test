# frozen_string_literal: true

class UrlHandler
  @links = {}

  def self.shorten(original_url)
    validated_url = handle_prefix(original_url)
    short_url = encode(validated_url)
    # check for http, https – add it if missing
    # create a short encoded url
    # save to the storage
    # return JSON with short and original URL
    { "short_url": short_url, "url": validated_url }
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

  private
  

end