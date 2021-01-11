class GifService
  class << self 
    def one_gif(weather_summary)
      response = conn.get("v1/gifs/search?api_key=#{ENV['giphy_api_key']}&q=#{weather_summary}&limit=1")
      parse_it_up(response)
    end

    private 

    def conn 
      Faraday.new(url: "https://api.giphy.com")
    end

    def parse_it_up(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end