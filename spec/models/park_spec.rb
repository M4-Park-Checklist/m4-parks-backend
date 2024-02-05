require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'associations' do
    it { should have_many :user_parks }
  end

  describe 'validations' do
    it { should validate_presence_of :nps_id }
    it { should validate_presence_of :name }
  end

  describe 'instance methods' do
    let (:park) { Park.create(nps_id: '123jst', name: 'Jellystone') }

    it 'exists' do
      expect(park).to be_valid
      expect(park).to be_a Park
    end

    it 'has a nps_id and name' do
      expect(park.nps_id).to eq '123jst'
      expect(park.name).to eq 'Jellystone'
    end
  end
end