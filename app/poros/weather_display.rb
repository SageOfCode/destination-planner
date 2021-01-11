class WeatherDisplay
  attr_reader :current_weather, :high_temp, :low_temp, :summary, :gif_url
  
  def initialize(attributes)
    @current_weather = attributes[:main][:temp]
    @high_temp = attributes[:main][:temp_max]
    @low_temp = attributes[:main][:temp_min]
    @summary = attributes[:weather][0][:description]
  end

  def set_gif(url)
    @gif_url = url
  end
end