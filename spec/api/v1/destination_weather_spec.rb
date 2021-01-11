require 'rails_helper'

describe "Destinations API" do 
  it 'sends a list of destinations' do
    VCR.use_cassette('80110_response') do

      get '/api/v1/destination_weather?zip=80110'
      expect(response).to be_successful

      destinations = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
    end 
  end 
end 