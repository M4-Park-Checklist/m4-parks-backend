require 'rails_helper'

RSpec.describe UserPark, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :park }
  end

  describe 'validations' do
    it { should allow_value(true).for(:visited) }
    it { should allow_value(false).for(:visited) }
    it { should_not allow_value(nil).for(:visited) }
  end

  describe 'instance methods' do
    let(:user) { User.create(first_name: 'Hermes', last_name: 'Conrad', email: 'hermes@pex.com') }
    let (:park) { Park.create(nps_id: '123jst', name: 'Jellystone') }
    let (:user_park) { UserPark.create(user_id: user.id, park_id: park.id, visited: true) }

    it 'exists' do
      expect(user_park).to be_valid
      expect(user_park).to be_a UserPark
    end

    it 'has a user, park, and visited' do
      expect(user_park.user).to eq user
      expect(user_park.park).to eq park
      expect(user_park.visited).to eq true
    end
  end
end