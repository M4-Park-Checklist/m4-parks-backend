class ParkFacade
  def self.get_parks
    parks = ParkService.get_parks[:data]

    parks.map do |park|
      p = Park.new(park)
    end
  end

  def self.get_park(park_code)
    park = ParkService.get_park(park_code)[:data]
    Park.new(park, true)
  end
end
