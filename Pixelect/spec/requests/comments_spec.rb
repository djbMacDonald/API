require 'rails_helper'

RSpec.describe 'Comment requests' do
  before(:each) do
    Comment.destroy_all
    Tournament.destroy_all
    User.destroy_all
    @user = User.create!(name: 'Bob', password: 'password', password_confirmation: 'password', email: 'a@a.com')
    @tourn = Tournament.create!(question: 'something?', user_id: @user.id)
    @user2 = User.create!(name: 'Mike', password: 'password2', password_confirmation: 'password2', email: 'm@m.com')
    @tourn2 = Tournament.create!(question: 'something also?', user_id: @user2.id)
    Comment.create!(body: "this is a comment body", user_id: @user.id, tournament_id: @tourn.id)
    @comment = Comment.create!(body: "this is another comment body", user_id: @user2.id, tournament_id: @tourn.id)
    Comment.create!(body: "this is a comment body", user_id: @user2.id, tournament_id: @tourn2.id)
    Comment.create!(body: "this is a comment body", user_id: @user.id, tournament_id: @tourn2.id)
  end

  describe '#index' do
    it 'gets all the comments from the associated tournament' do
      get "/tournaments/#{@tourn.id}/comments"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 2
    end
  end

  describe '#create' do
    it 'creates a new comment' do
      post "/tournaments/#{@tourn.id}/comments/",
      {
        comment: {
          body: "body",
          user_id: @user.id,
          tournament_id: @tourn.id
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      comment = JSON.parse(response.body)
      expect(comment["body"]).to eq "body"
    end
  end

  describe '#update' do
    it 'updates a comment' do
      patch "/tournaments/#{@tourn.id}/comments/#{@comment.id}",
      {
        comment: {
          body: "body",
          user_id: @user2.id,
          tournament_id: @tourn.id,
          subcomment: "some text"
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      comment = JSON.parse(response.body)
      expect(comment["subcomment"]).to eq "some text"
    end
  end
end
