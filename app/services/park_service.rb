class ParkService
  def self.get_parks
    conn = Faraday.new(url: 'https://developer.nps.gov') do |faraday|
      faraday.params['api_key'] = ENV['NPS_API_KEY']
      faraday.params['limit'] = 500
    end
    JSON.parse(conn.get('/api/v1/parks').body, symbolize_names: true)
  end
end