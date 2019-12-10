Rails.application.routes.draw do
  
  get 'purchase/index'
  get 'purchase/done'
  get 'creditcard/new'
  get 'creditcard/show'
  root to: 'items#index'
  resources :items, only: [:index, :new, :create] do
    collection do
      get "category_find"
    end
  end

  resources :items, only: [:index, :new, :show] do
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
  end
  resources :users, only: :show do
    member do
      get "profile"
      get "signout"
    end
  end
  resources :creditcard, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'pay2', to: 'creditcard#pay2'
      post 'pay3', to: 'creditcard#pay3'
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
