class ParkFacade
  def self.get_parks
    parks = ParkService.get_parks[:data]

    parks.map do |park|
      Park.new(park)
    end
  end
end
