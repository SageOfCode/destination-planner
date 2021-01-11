class GifFacade
  def self.get_a_gif(weather_summary)
    data = GifService.one_gif(weather_summary)
    data[:data][0][:images][:original][:url]
  end

  def self.grab_gif(weather)
    gif_url = get_a_gif(weather.summary)
    weather.set_gif(gif_url)
    weather
  end
end