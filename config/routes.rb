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
      get 'user_add'
      get 'phone_add'
      get 'address_add'
      get 'card_add'
      get 'complete'
    end
  end
end
