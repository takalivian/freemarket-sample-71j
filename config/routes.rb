Rails.application.routes.draw do
  root to:"items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :items, only: [:index, :new, :create, :show, :destroy] do
    get :purchase, on: :member
  end
end
