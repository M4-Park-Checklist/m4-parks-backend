class ParkService
  def self.base_connection
    Faraday.new(url: 'https://developer.nps.gov') do |faraday|
      faraday.headers['X-API-KEY'] = Rails.application.credentials.nps[:key]
    end
  end

  def self.get_parks
    conn = base_connection
    conn.params['limit'] = 500
    JSON.parse(conn.get('/api/v1/parks').body, symbolize_names: true)
  end

  def self.get_alerts(park_code)
    conn = base_connection
    JSON.parse(conn.get("/api/v1/alerts?parkCode=#{park_code}").body, symbolize_names: true)
  end

  def self.get_amenities(park_code)
    conn = base_connection
    JSON.parse(conn.get("/api/v1/amenities?parkCode=#{park_code}").body, symbolize_names: true)
  end

  def self.get_park(park_code)
    conn = base_connection
    JSON.parse(conn.get("/api/v1/parks?parkCode=#{park_code}").body, symbolize_names: true)
  end
end