Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :categories, only: [:new, :create, :edit, :update, :destroy]

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :shopping_bag_products, only: [:create]
  end

  resources :shopping_bag_products, only: [:update, :destroy]
  resources :shopping_bags, only: [:show]

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
