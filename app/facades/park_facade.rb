class ParkFacade
  def self.get_parks
    parks = ParkService.get_parks[:data]

    parks.map do |park|
      p = Parksite.new(park)
    end
  end

  def self.get_park(park_code)
    park = ParkService.get_park(park_code)[:data].first

    Parksite.new(park, true)
  end
end
