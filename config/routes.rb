Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  root to:"items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :items, only: [:index, :new, :create, :show] do
    get :purchase, on: :member
  end
  resources :cards, only: [:new, :show] do
    collection do
      get 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end
