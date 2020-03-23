Rails.application.routes.draw do
  devise_for :users

  
  root to:"toppages#index"
  
  resources :toppages
  resources :items


end
