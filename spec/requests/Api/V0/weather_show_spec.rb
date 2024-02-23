require 'rails_helper'

RSpec.describe 'weather requests' do
  describe 'happy path' do
    it 'returns 14 days of forecast data for a park', :vcr do
      get '/api/v0/weather/yell'
      require 'pry'; binding.pry
      expect(response).to be_successful 
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)

      forecast = body[:data]

      expect(forecast).to have_key(:id)
      expect()

      require 'pry'; binding.pry
    end
  end
end