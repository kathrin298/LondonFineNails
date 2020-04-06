Rails.application.routes.draw do
  get 'shopping_bags/show'
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:new, :create, :edit, :update, :destroy]

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :shopping_bag_products, only: [:create]
  end

  resources :shopping_bag_products, only: [:update, :delete]

  resources :shopping_bags, only: [:show]

  get 'dashboard', to: 'pages#dashboard'

end
