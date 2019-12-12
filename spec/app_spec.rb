# frozen_string_literal: true

require 'spec_helper'

describe UrlShortener do
  include Rack::Test::Methods

  let(:app) { UrlShortener.new }

  describe 'POST to /' do
    it 'returns ok and responds with a JSON' do
      data = { 'url': 'https://www.farmdrop.com/' }

      post '/', data.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(last_response).to be_ok
      response = JSON.parse(last_response.body)
      expect(response).to have_key('url')
      expect(response['url']).to eql('https://www.farmdrop.com/')
    end
  end

  describe 'GET to /:short_url' do
    it 'redirects to original URL from short URL' do
      data = { 'url': 'https://www.farmdrop.com/' }
      post '/', data.to_json, 'CONTENT_TYPE' => 'application/json'
      response = JSON.parse(last_response.body)
      short_url = response["short_url"]
      get "/#{short_url}"
      expect(last_response).to be_redirect
      expect(last_response.location).to eql('https://www.farmdrop.com/')
      expect(last_response.body).to eql(data.to_json)
    end
  end
end
