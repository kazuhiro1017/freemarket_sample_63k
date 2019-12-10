Rails.application.routes.draw do
  
  root to: 'items#index'
  
  resources :items do
    collection do
      get "category_find"
    end
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
    member do
      get "card"
      get "profile"
      get "signout"
      post "logging_off"
      get 'identification'
    end
  end
end
