class WeatherService
  class << self
    def current_weather(zip_code)
      response = conn.get("/data/2.5/weather?zip=#{zip_code}&units=imperial&appid=#{ENV['weather_api_key']}")
      parse_it_up(response)
    end

    private 

    def conn 
      Faraday.new(url: "https://api.openweathermap.org") 
    end

    def parse_it_up(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end 
end