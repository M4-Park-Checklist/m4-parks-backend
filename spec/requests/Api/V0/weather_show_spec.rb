require 'rails_helper'

RSpec.describe 'weather requests' do
  describe 'happy path' do
    it 'returns 14 days of forecast data for a park', :vcr do
      get 'api/v1/weather/acad'
    end
  end
end