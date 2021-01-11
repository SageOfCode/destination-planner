class WeatherFacade
  def self.get_current_weather(zip_code)
    data = WeatherService.current_weather(zip_code)
    WeatherDisplay.new(data)
  end
end