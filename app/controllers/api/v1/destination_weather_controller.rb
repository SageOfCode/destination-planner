class Api::V1::DestinationWeatherController < ApplicationController
  def search 
    weather = WeatherFacade.get_current_weather(params[:zip])
    weather = GifFacade.grab_gif(weather)
    render json: weather
  end
end