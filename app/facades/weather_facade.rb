class WeatherFacade
  def self.get_forecast(park_code)
    address = ParkService.get_park(park_code)
    require 'pry'; binding.pry
    WeatherService.get_forecast(address)
  end
end