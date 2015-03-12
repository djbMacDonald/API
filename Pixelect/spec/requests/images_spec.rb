require 'rails_helper'

RSpec.describe 'Image requests' do
  before(:each) do
    Image.destroy_all
    Tournament.destroy_all
    User.destroy_all
    @user = User.create!(name: 'Bob', password: 'password', password_confirmation: 'password', email: 'a@a.com')
    @tourn = Tournament.create!(question: 'something?', user_id: @user.id)
    @tourn2 = Tournament.create!(question: 'something also?', user_id: @user.id)
    @img = Image.create(tournament_id: @tourn.id, url: 'something.something.jpeg')
    Image.create(tournament_id: @tourn.id, url: 'something2.something.jpeg')
    Image.create(tournament_id: @tourn.id, url: 'something3.something.jpeg')
    Image.create(tournament_id: @tourn.id, url: 'something4.something.jpeg')
    Image.create(tournament_id: @tourn2.id, url: 'something5.something.jpeg')
  end

  describe '#index' do
    it 'shows all images for that tournament' do
      get "/tournaments/#{@tourn.id}/images"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 4
    end
  end
  describe '#create' do
    it 'creates a new image' do
      post "/images",
      { image: {
        url: 'something',
        tournament_id: @tourn.id
        }
      }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end
  describe '#show' do
    it 'shows a chosen picture' do
      get "/images/#{@img.id}"
      expect(response).to be_success
      expect(response["url"]).to eq "something.something.jpeg"
    end
  end
  describe '#update' do
    it 'changes the properties of an image' do
      patch "/images/#{@img.id}",
      { image: {
        flags: 1,
        wins: 1
        }
      }
    end
  end
end
