require 'rails_helper'

RSpec.describe 'Tournament requests' do
  before(:each) do
    Tournament.destroy_all
    User.destroy_all
    @user = User.create!(name: 'Bob', password: 'password', password_confirmation: 'password', email: 'a@a.com')
    @user2 = User.create!(name: 'Mike', password: 'password2', password_confirmation: 'password2', email: 'm@m.com')
    @tourn = Tournament.create!(question: 'something?', user_id: @user.id)
    @tourn2 = Tournament.create!(question: 'something also?', user_id: @user2.id)
  end

  describe '#index' do
    it 'gets all the tournaments' do
      get "/tournaments"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 2
    end
  end

  describe '#index' do
    it 'gets all the tournaments created by the associated user' do
      get "/users/#{@user.id}/tournaments"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 1
    end
  end

  describe '#create' do
    it 'creates a new tournament' do
      post "/tournaments",
      {
        tournament: {
          question: "which color is warmer?",
          user_id: @user.id
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      tournament = JSON.parse(response.body)
      expect(tournament["question"]).to eq "which color is warmer?"
    end

    it 'can create a tournament with images' do
      post "/tournaments",
      {
        tournament: {
          question: "which color is warmer?",
          user_id: @user.id,
          images: [{url: 'asd'}, {url: 'cec'}, {url: 'qwe'}]
        }
      }
    end
  end

  describe '#update' do
    it 'updates a tournament' do
      patch "/tournaments/#{@tourn.id}",
      {
        tournament: {
          email_list: @user.email
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      tournament = JSON.parse(response.body)
      expect(tournament["email_list"]).to eq "a@a.com"
    end
  end

  describe '#show' do
    it 'shows a single tournament' do
      get "/tournaments/#{@tourn.id}"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json["question"]).to eq "something?"
    end
  end
end
