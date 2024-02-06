require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :user_parks }
    it { should have_many(:parks).through(:user_parks) }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
  end

  describe 'instance methods' do
    let(:user) { User.create(first_name: 'Hermes', last_name: 'Conrad', email: 'hermes@pex.com') }

    it 'exits' do
      expect(user).to be_valid
      expect(user).to be_a User
    end

    it 'has a first name, last name, and email' do
      expect(user.first_name).to eq 'Hermes'
      expect(user.last_name).to eq 'Conrad'
      expect(user.email).to eq 'hermes@pex.com'
    end
  end
end