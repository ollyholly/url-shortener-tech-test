# frozen_string_literal: true


require 'url_handler'

describe UrlHandler do
  describe '#shorten' do
    it 'returns original URL' do
      url_handler = UrlHandler.shorten('http://google.com')
      expect(url_handler[:url]).to eq 'http://google.com'
    end

    it 'it adds http:// to the original URL' do
      url_handler = UrlHandler.shorten('www.farmdrop.com')
      expect(url_handler[:url]).to eq('http://www.farmdrop.com')
    end

    it 'returns short 6 character URL' do
      url_handler = UrlHandler.shorten('http://google.com')
      expect(url_handler[:short_url].length).to eq 6
    end
  end

  describe '#find' do
    it 'finds original URL in a storage by short URL and returns it' do
      url_handler = UrlHandler.shorten('http://bbc.co.uk')
      short_url = url_handler[:short_url]
      expect(UrlHandler.find(short_url)).to eq("url": 'http://bbc.co.uk')
    end
  end
end
