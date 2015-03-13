Rails.application.routes.draw do
  resources :users, only: [:create, :show] do
    post 'sign_in', on: :collection
    resources :tournaments, only: [:index]
  end
  resources :tournaments, only: [:create, :show, :index, :update, :destroy] do
    resources :images, only: [:index]
    resources :comments, only: [:create, :index]
  end
  resources :images, only: [:create, :show, :flag, :update]
  resources :comments, only: [:update]
end
