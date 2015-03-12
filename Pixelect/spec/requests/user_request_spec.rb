require 'rails_helper'

RSpec.describe 'User requests' do
  before(:each) do
    User.destroy_all
    @user = User.create!(name: 'Bob', password: 'password', password_confirmation: 'password', email: 'a@a.com')
    @user2 = User.create!(name: 'Mike', password: 'password2', password_confirmation: 'password2', email: 'm@m.com')
    @users = User.all
  end

  describe '#create' do
    it 'creates a new user' do
      post "/users",
      {
        user: {
          name: "SamoanThor",
          email: "samoan_thor@gmail.com",
          password: '2fast2furious',
          password_confirmation: '2fast2furious'
        }
      }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      auth = JSON.parse(response.body)
      expect(auth["token"]).to be_a String
    end
  end

  describe '#show' do
    it 'should retrieve a single user by id and return json' do
      @user = @users.first
      get "/users/#{@user.id}"
      expect(response).to be_success
      user = JSON.parse(response.body)
      expect(user['name']).to eq @user.name
    end
  end


end
