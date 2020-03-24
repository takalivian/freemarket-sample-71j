Rails.application.routes.draw do

  devise_for :users
  root to:"toppages#index"
  resources :toppages, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
end
