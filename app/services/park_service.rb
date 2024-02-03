class ParkService
  def self.get_parks
    conn = Faraday.new(url: 'https://developer.nps.gov') do |faraday|
      faraday.headers['X-API-KEY'] = Rails.application.credentials.nps[:key]
      faraday.params['limit'] = 500
    end
    JSON.parse(conn.get('/api/v1/parks').body, symbolize_names: true)
  end
end
