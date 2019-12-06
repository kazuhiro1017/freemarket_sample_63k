Rails.application.routes.draw do
  
  root to: 'items#index'
  resources :items, only: [:index, :new] do
    member do
      get "purchase"
    end
  end

  resources :users do
    collection do
      get 'login'
      post 'logging_in'
      get 'user_add'
      get 'phone_add'
      get 'address_add'
      get 'card_add'
      get 'complete'
    end
  end
  resources :users, only: :show do
    collection do
      get "profile"
      get "signout"
      get "card"
    end
  end
end
