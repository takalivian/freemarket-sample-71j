Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  root to:"items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:show]

  resources :items, only: [:index, :new, :create, :show] do
    get :purchase, on: :member
    get 'pay', to: 'purchase#pay'
    resources :purchase, only: [:show] do
      collection do
        post 'done', to: 'purchase#done'
      end
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      get 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end
end
