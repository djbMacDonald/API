require 'rails_helper'

RSpec.describe User do
  describe 'user validations' do
    it 'is invalid without a name' do
      expect(User.create(name: '')).not_to be_valid
    end

    it 'is invalid without a password' do
      expect(User.create(password: '')).not_to be_valid
    end

    it 'is invalid without an email' do
      expect(User.create(email: '')).not_to be_valid
    end

    it 'is valid with a name, email, and password' do
      expect(User.create(name: 'SamoanThor', email: 'samoan_thor@fastandfurious.com', password:'2fast2furious', password_confirmation:'2fast2furious')).to be_valid
    end
  end
end
