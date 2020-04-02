Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:new, :create, :edit, :update, :destroy]
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
  get 'dashboard', to: 'pages#dashboard'
end
