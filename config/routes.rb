Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index] do
    post 'sign_in', on: :collection
    resources :tournaments, only: [:index]
  end
  resources :tournaments, only: [:create, :show, :index, :update, :destroy] do
    resources :comments, only: [:create, :index]
  end
  post '/images/:id/win', to: 'images#win'
  post '/images/:id/flag', to: 'images#flag'
  resources :comments, only: [:update]

  resources :amazon, only: [] do
    get 'sign_key', on: :collection
  end
end
