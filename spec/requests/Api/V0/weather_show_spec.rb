require 'rails_helper'

RSpec.describe 'weather requests' do
  describe 'happy path' do
    it 'returns 14 days of forecast data for a park', :vcr do
      get '/api/v0/weather/yell'

      expect(response).to be_successful 
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)

      forecast = body[:data]

      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to be(nil)
      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to eq('weather')
      expect(forecast).to have_key(:attributes)
      expect(forecast[:attributes]).to be_a(Hash)
      
      attributes = forecast[:attributes]

      expect(attributes).to have_key(:id)
      expect(attributes[:id]).to be(nil)
      expect(attributes).to have_key(:forecast)
      expect(attributes[:forecast]).to be_a(Array)
      
      forecast_day = attributes[:forecast][0]

      expect(forecast_day).to have_key(:date)
      expect(forecast_day[:date]).to be_a(String)
      expect(forecast_day).to have_key(:sunrise)
      expect(forecast_day[:sunrise]).to be_a(String)
      expect(forecast_day).to have_key(:sunset)
      expect(forecast_day[:sunset]).to be_a(String)
      expect(forecast_day).to have_key(:max_temp)
      expect(forecast_day[:max_temp]).to be_a(Float)
      expect(forecast_day).to have_key(:min_temp)
      expect(forecast_day[:min_temp]).to be_a(Float)
      expect(forecast_day).to have_key(:condition)
      expect(forecast_day[:condition]).to be_a(String)
      expect(forecast_day).to have_key(:icon)
    end
  end

  describe 'sad path' do
    it 'errors if the park id is invalid', :vcr do
      get '/api/v0/weather/123'

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"error\":\"Invalid park id\"}")
    end
  end
end