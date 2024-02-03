class ParkFacade
  def self.get_parks
    parks = ParkService.get_parks[:data]

    parks.map do |park|
      p = Park.new(park)
      require 'pry'; binding.pry
    end
  end
end
