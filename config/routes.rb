Rails.application.routes.draw do
  

  root to: 'items#index'
  
  resources :items do
    collection do
      get "category_find"
    end
    member do
      get "purchase1"
      post 'pay'
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
      get "signout"
      get "card"
      get "profile"
      post "logging_off"
      get 'identification'
      get "my_selling_items"
    end
  end

  resources :creditcard, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'pay_second', to: 'creditcard#pay_second'
      post 'pay_third', to: 'creditcard#pay_third'
      post 'delete', to: 'creditcard#delete'
    end
    member do
      get "card"
      get "registrationcard"
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
    end
    member do
      get 'done', to: 'purchase#done'
    end
  end

end
