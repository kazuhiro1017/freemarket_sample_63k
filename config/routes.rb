Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
    
  devise_scope :user do
    get 'users/sign_up/user_info', to: 'users/registrations#user_add'
    get 'users/sign_up/phone_info', to: 'users/registrations#phone_add'
    get 'users/sign_up/address_info', to: 'users/registrations#address_add'
    get 'users/sign_up/card_info', to: 'users/registrations#card_add'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end
  root to: 'items#index'
  resources :items, only: [:index, :new] do
  member do
    get "purchase"
  end
end
  resources :users, only: :show
end
