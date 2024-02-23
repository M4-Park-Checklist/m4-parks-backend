class WeatherService
  def self.get_weather(addresses)
    conn = Faraday.new(url: 'https://sweater-weather-35ecb02d6385.herokuapp.com') do |faraday|
      faraday.params['location'] = "#{addresses[0][:city]},#{addresses[0][:stateCode]}"
    end
    response = conn.get('/api/v0/forecast/')
    
    JSON.parse(response.body, symbolize_names: true)
  end
end