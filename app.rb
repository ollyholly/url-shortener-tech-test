# frozen_string_literal: true
require 'sinatra'
require 'json'

class UrlShortener < Sinatra::Base
  set :json_encoder, :to_json

  get '/' do
    'Lets shorten some URLs!'
  end

  post '/' do
    link = JSON.parse(request.body.read)['url']
    {"url": link}.to_json
  end
end

