class Api::V0::ParksController < ApplicationController
  def index
    render json: ParkSerializer.new(ParkFacade.get_parks)
  end
end