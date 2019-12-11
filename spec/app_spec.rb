require "spec_helper"

describe UrlShortener do
  include Rack::Test::Methods

  let (:app) { UrlShortener.new }

  context "GET /" do
    it "Responds status 200 OK" do
      get "/"
      expect(last_response.status).to eq 200
    end

    it "Sends a response with a body" do
      get "/"
      expect(last_response.body).to eq "Lets shorten some URLs!"
    end

  end
end 