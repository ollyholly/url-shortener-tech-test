# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'base64'
require './lib/url_handler'

class UrlShortener < Sinatra::Base
  set :json_encoder, :to_json

  post '/' do
    link = JSON.parse(request.body.read)['url']
    response = UrlHandler.shorten(link)
    response.to_json
  end

  get '/:url' do
    short_url = params[:url]
    original_link = UrlHandler.find(short_url)
    redirect original_link[:url], original_link.to_json
  end

  run! if app_file == $PROGRAM_NAME
end
