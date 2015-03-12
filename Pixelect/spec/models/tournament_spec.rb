require 'rails_helper'

RSpec.describe Tournament do
  describe '.create' do
    it 'creates a new tournament' do
      expect(Tournament.create()).to be_a Tournament
    end

    it 'is valid' do
    user1 = User.create!(name: 'Rick Grimes', password: 'dfdf', email: 'walkingdead@amc.com')
    expect(Tournament.create!(user_id: user1.id, question: "best tv show?")).to be_valid
  end

  it 'is invalid without a user' do
    expect(Tournament.create!(question: "best tv show?")).not_to be_valid
  end

  it 'is invalid without a question' do
    user1 = User.create!(name: 'Rick Grimes', password: 'dfdf', email: 'walkingdead@amc.com')
    expect(Tournament.create!(user_id: user1.id, question: null)).not_to be_valid
    end
  end
end
