require 'rails_helper'

describe "Destinations API" do 
  it 'sends a list of destinations' do
    denver = Destination.create!(
          name: "Denver",
          zip: "80204",
          description: "Mile High City",
          image_url: "https://upload.wikimedia.org/wikipedia/commons/e/e8/Denver_skyline.jpg"
    )
    sedona = Destination.create!(
          name: "Sedona",
          zip: "86336",
          description: "Red Rock Country",
          image_url: "https://upload.wikimedia.org/wikipedia/commons/e/e8/Denver_skyline.jpg"
    )

    get '/api/v1/destinations'

    expect(response).to be_successful

    destinations = JSON.parse(response.body, symbolize_names: true)

    expect(destinations.count).to eq(2)

    destinations.each do |destination|
      expect(destination).to have_key(:id)
      expect(destination[:id]).to be_an(Integer)

      expect(destination).to have_key(:name)
      expect(destination[:name]).to be_a(String)

      expect(destination).to have_key(:zip)
      expect(destination[:zip]).to be_a(String)

      expect(destination).to have_key(:description)
      expect(destination[:description]).to be_a(String)

      expect(destination).to have_key(:image_url)
      expect(destination[:image_url]).to be_a(String)
    end
  end 
end 