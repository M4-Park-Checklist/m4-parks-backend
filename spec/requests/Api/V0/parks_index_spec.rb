require 'rails_helper'

RSpec.describe 'Api::V0::Parks', type: :request do
  describe 'happy path' do
    it 'returns a list of parks' do
      get '/api/v0/parks'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parks = JSON.parse(response.body, symbolize_names: true)

      require 'pry'; binding.pry
      
      expect(parks).to be_a(Hash)
      expect(parks).to have_key(:data)
      expect(parks).to have_key(:type)
      expect(parks[:type]).to eq('parks')
      expect(parks[:data]).to be_an(Array)
      expect(parks[:data][0]).to have_key(:id)
      expect(parks[:data][0][:id]).to be_a(String)
      expect(parks[:data][0]).to have_key(:attributes)

      # fullName
      # id
      # statecode(from the address block?)
      # media(not sure how this one is managed, but id love to be able to have like, 5 pictures from a park and a video?)
      # recent news (can just be the most recent entry in the news fetch)
      # active alerts
      # things to do (like 3 items)
      # amenities
      # campgrounds
      # events
      # activities
      # Hours of operation
      # weather(think you guys have this handled already?)
    end
  end
end