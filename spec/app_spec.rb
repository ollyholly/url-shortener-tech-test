# frozen_string_literal: true

require 'spec_helper'

describe UrlShortener do
  include Rack::Test::Methods

  let (:app) { UrlShortener.new }
  # let (:url) { "https://www.farmdrop.com/" }

  describe 'GET to /' do
    it 'Responds status 200 OK' do
      get '/'
      expect(last_response.status).to eq 200
    end

    it 'Sends a response with a body' do
      get '/'
      expect(last_response.body).to eq 'Lets shorten some URLs!'
    end
  end

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
end
