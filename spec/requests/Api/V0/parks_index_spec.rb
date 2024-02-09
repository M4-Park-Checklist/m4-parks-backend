require 'rails_helper'

RSpec.describe 'Api::V0::Parks', type: :request do
  describe 'index requests' do
    describe 'happy path' do
      it 'returns a list of parks', :vcr do
        get '/api/v0/parks'

        expect(response).to be_successful
        expect(response.status).to eq(200)

        parks = JSON.parse(response.body, symbolize_names: true)

        expect(parks).to be_a(Hash)
        expect(parks).to have_key(:data)

        park = parks[:data][0]

        expect(park).to be_a(Hash)
        expect(park).to have_key(:id)
        expect(park[:id]).to be_a(String)
        expect(park).to have_key(:type)
        expect(park[:type]).to eq('park')
        expect(park).to have_key(:attributes)
        
        attributes = park[:attributes]

        expect(attributes).to be_a(Hash)
        expect(attributes).to have_key(:id)
        expect(attributes[:id]).to be_a(String)
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a(String)
        expect(attributes).to have_key(:designation)
        expect(attributes[:designation]).to be_a(String)
        expect(attributes).to have_key(:description)
        expect(attributes[:description]).to be_a(String)
        expect(attributes).to have_key(:park_code)
        expect(attributes[:park_code]).to be_a(String)
        expect(attributes).to have_key(:states)
        expect(attributes[:states]).to be_a(String)
        expect(attributes).to have_key(:media)
        expect(attributes[:media]).to be_a(Array)
        expect(attributes).to have_key(:active_alerts)
        expect(attributes[:active_alerts]).to be_nil
        expect(attributes).to have_key(:things_to_do)
        expect(attributes[:things_to_do]).to be_nil
        expect(attributes).to have_key(:amenities)
        expect(attributes[:amenities]).to be_nil
        expect(attributes).to have_key(:hours_of_operation)
        expect(attributes[:hours_of_operation]).to be_nil
        expect(attributes).to have_key(:current_weather)
        expect(attributes[:current_weather]).to be_nil
      end
    end

    describe 'sad path' do
      it 'returns an error if the request is invalid', :vcr do
        allow(ParkFacade).to receive(:get_parks).and_return([])

        get '/api/v0/parks'
        expect(response).to_not be_successful
        
        expect(response.status).to eq(404)

        expect(response.body).to eq("{\"error\":\"No parks found\"}")
      end
    end
  end
end