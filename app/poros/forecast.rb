class Forecast
  attr_reader :forecast, :id

  def initialize(data)
    @forecast = data[:data][:attributes][:daily_weather]
  end
end