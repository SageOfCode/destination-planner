class PoemsController < ApplicationController
  def index  
    text = "Hello World"
    url = ENV['ibm_url']
    username = "apikey"
    password = ENV['ibm_api_key']
    conn = Faraday.new(url: url) do |connection|
      # connection.adapter Faraday.default_adapter
      connection.basic_auth(username, password)
    end

    # response = conn.get('/v3/tone?version=2017-09-21&text=Team%2C%20I%20know%20that%20times%20are%20tough%21%20Product%20sales%20have%20been%20disappointing%20for%20the%20past%20three%20quarters.%20We%20have%20a%20competitive%20product%2C%20but%20we%20need%20to%20do%20a%20better%20job%20of%20selling%20it%21') 
    response = conn.get('/v3/tone') do |req|
      req.params["version"] = "2017-09-21"
      req.params["text"] = text
      # req.headers 
    end
    require 'pry'; binding.pry
    @tone = JSON.parse(response.body, symbolize_names: true)
  end
end