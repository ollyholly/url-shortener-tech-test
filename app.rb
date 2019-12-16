# frozen_string_literal: true

require 'pry'
require 'sinatra'
require 'json'
require './lib/url_handler'

class UrlShortener < Sinatra::Base
  set :json_encoder, :to_json

  post '/' do
    req = request.body.read
    link = handle_json_parse(req)

    if link
    response = UrlHandler.shorten(link)
    response.to_json
    else
      status 400
    end

  end

  get '/:url' do
    short_url = params[:url]
    original_link = UrlHandler.find(short_url)
    redirect original_link[:url], original_link.to_json
  end

  def handle_json_parse(req)
    begin
      json = JSON.parse(req)['url']
    rescue JSON::ParserError
      return 
    end
  end

  run! if app_file == $PROGRAM_NAME
end
