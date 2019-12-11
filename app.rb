require 'sinatra'

class UrlShortener < Sinatra::Base

  get '/' do
    'Lets shorten some URLs!'
  end
  
end