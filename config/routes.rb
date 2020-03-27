Rails.application.routes.draw do
  get 'products/show'
  get 'products/new'
  get 'products/edit'
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
end
