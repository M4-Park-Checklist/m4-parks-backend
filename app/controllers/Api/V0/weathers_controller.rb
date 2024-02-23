class WeathersController < ApplicationController
  def show
    if params[:id].length != 4
      render json: {error: "Invalid park id"}, status: 400      
    else
      render json: WeatherSerializer.new(WeatherFacade.get_forecast(params[:id]))
    end
  end
end