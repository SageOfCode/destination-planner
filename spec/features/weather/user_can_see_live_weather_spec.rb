require 'rails_helper'

RSpec.describe 'As a visitor' do 
  describe 'When I visit a destination show page' do 
    it 'I see up to date weather' do 
      VCR.use_cassette('denver_show') do
        denver = Destination.create!(
          name: "Denver",
          zip: "80204",
          description: "Mile High City",
          image_url: "https://upload.wikimedia.org/wikipedia/commons/e/e8/Denver_skyline.jpg"
        )
        visit "destinations/#{denver.id}"

        expect(page).to have_content("Denver")  
      end 
    end
  end
end