# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'base64'
require './lib/url_handler'

class UrlShortener < Sinatra::Base
  set :json_encoder, :to_json

  get '/' do
    'Lets shorten some URLs!'
  end

  post '/' do
    link = JSON.parse(request.body.read)['url']
    UrlHandler.shorten(link)
    { "url": link }.to_json
  end

  run! if app_file == $PROGRAM_NAME
end
