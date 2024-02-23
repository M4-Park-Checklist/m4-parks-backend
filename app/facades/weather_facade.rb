class WeatherFacade
  def self.get_forecast(park_code)
    park = ParkService.get_park(park_code)

    location = park[:data][0][:addresses]
    forecast = Forecast.new(WeatherService.get_weather(location))
  end
end