Rails.application.routes.draw do
  get 'categories/new'
  get 'categories/edit'
  get 'products/show'
  get 'products/new'
  get 'products/edit'
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
end
