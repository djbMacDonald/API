require 'rails_helper'

RSpec.describe Comment do
  describe '.create' do
    before(:each) do
      @user = User.create!(name: 'Bob', password: 'password', password_confirmation: 'password', email: 'a@a.com')
      @tourn = Tournament.create!(question: 'something?', user_id: @user.id)
    end

    it 'creates a new comment' do
      expect(Comment.create()).to be_a Comment
    end

    it 'is not valid without a body' do
      expect(Comment.create(user_id: @user.id, tournament_id: @tourn.id)).not_to be_valid
    end

    it 'is not valid without a user' do
      expect(Comment.create(body: 'hi', tournament_id: @tourn.id)).not_to be_valid
    end

    it 'is not valid without a tournament' do
      expect(Comment.create(body: 'hi', user_id: @user.id)).not_to be_valid
    end

    it 'is valid with a tournament and user' do
      expect(Comment.create(body: 'hi', user_id: @user.id, tournament_id: @tourn.id)).to be_valid
    end
  end
end
