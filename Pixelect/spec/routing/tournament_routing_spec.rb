require 'rails_helper'

RSpec.describe 'routes for tournaments' do
   it 'routes GET /tournaments to the tournaments controller' do
    expect(get('/tournaments')).to route_to(
      controller: "tournaments",
      action: "index"
      )
  end

    it 'routes GET /tournaments to the tournaments controller' do
      expect(get('users/1/tournaments')).to route_to(
      controller: "tournaments",
      action: "index",
      user_id: "1"
      )
  end

  it 'routes GET /tournaments/1 to the tournaments controller' do
    expect(get('/tournaments/1')).to route_to(
      controller: "tournaments",
      action: "show",
      id: "1"
      )
  end

  it 'routes POST /tournaments to the tournaments controller' do
    expect(post('/tournaments')).to route_to(
       controller: "tournaments",
      action: "create"
      )
  end

  it 'routes PATCH /tournaments/1 to the tournaments controller and sets new params' do
     expect(patch('/tournaments/1')).to route_to(
      controller: 'tournaments',
      action: 'update',
      id: '1'
    )
  end
end

