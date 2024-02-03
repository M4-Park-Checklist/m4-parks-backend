require 'rails_helper'

RSpec.describe 'Api::V0::Parks', type: :request do
  describe 'show requests' do
    describe 'happy path' do
      it 'returns a single park', :vcr do
        get '/api/v0/parks/acad'

        expect(response).to be_successful 
        expect(response.status).to eq(200)

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to be_a(Hash)
        expect(body).to have_key(:data)

        park = body[:data]

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
        expect(attributes).to have_key(:states)
        expect(attributes[:states]).to be_a(String)
        expect(attributes).to have_key(:media)
        expect(attributes[:media]).to be_a(Array)
        expect(attributes).to have_key(:active_alerts)
        expect(attributes[:active_alerts]).to be_a(Array)
        expect(attributes).to have_key(:things_to_do)
        expect(attributes[:things_to_do]).to be_a(Array)
        expect(attributes).to have_key(:amenities)
        expect(attributes[:amenities]).to be_a(Array)
        expect(attributes).to have_key(:hours_of_operation)
        expect(attributes[:hours_of_operation]).to be_a(Hash)
        expect(attributes).to have_key(:current_weather)
        expect(attributes[:current_weather]).to be_a(Hash)
      end
    end
  end
end