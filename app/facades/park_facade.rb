class ParkFacade
  def self.get_parks
    parks = ParkService.get_parks
    parks.map do |park|
      Park.new(park)
    end
  end
end
