Rails.application.routes.draw do
  resources :users, only: [:create, :show] do
    resources :tournaments, only: [:index]
  end
  resources :tournaments, only: [:create, :show, :index, :update] do
    resources :images, only: [:index]
    resources :comments, only: [:create, :update, :index]
  end
  resources :images, only: [:show, :flag]
end
