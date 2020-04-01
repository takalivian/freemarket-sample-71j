Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to:"items#index"
  get 'purchase/index'
  get 'purchase/done'

  resources :users, only: [:show]

  resources :items, only: [:index, :new, :create, :show, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
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
