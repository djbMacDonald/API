require 'rails_helper'

RSpec.describe Image do
  describe '.create' do
    before(:each) do
      @user = User.create!(name: 'Bob', password: 'password', password_confirmation: 'password', email: 'a@a.com')
      @tourn = Tournament.create!(question: 'something?', user_id: @user.id)
    end

    it 'creates a new image' do
      expect(Image.create()).to be_a Image
    end

    it 'is invalid without a url' do
      expect(Image.create(tournament_id: @tourn.id)).not_to be_valid
    end

    # it 'is invalid without a tournament' do
    #   expect(Image.create(url: 'example@example.com')).not_to be_valid
    # end

    it 'is valid with a url and tournament' do
      expect(Image.create(url: 'http://sampleurl.com', tournament_id: @tourn.id)).to be_valid
    end

    it 'has a default of 0 wins' do
      expect((Image.create(url: 'http://sampleurl.com', tournament_id: @tourn.id).wins)).to eq 0
    end

    it 'has a default of 0 flags' do
      expect((Image.create(url: 'http://sampleurl.com', tournament_id: @tourn.id).flags)).to eq 0
    end
  end
end
