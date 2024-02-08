class Api::V0::ParksController < ApplicationController
  def index
    data = ParkFacade.get_parks

    if data.empty?
      render json: {error: "No parks found"}, status: 404
    else
      render json: ParkSerializer.new(data)
    end
  end

  def show
    if params[:id].nil?
      render json: {error: "Invalid park id"}, status: 400
    elsif params[:id].length != 4
      render json: {error: "Invalid park id"}, status: 400      
    else
      render json: ParkSerializer.new(ParkFacade.get_park(params[:id]))
    end
  end
end