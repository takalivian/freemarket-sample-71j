Rails.application.routes.draw do
  root to:"toppages#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :toppages, only: :index
end