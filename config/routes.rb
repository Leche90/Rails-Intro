# config/routes.rb
Rails.application.routes.draw do
  # Home route
  root 'home#index'  # Home controller with index action

  # Static pages
  get 'about', to: 'pages#about'

  # Nested routes for users and transactions
  resources :users do
    resources :transactions, only: [:index]
  end

  # Nested routes for exchanges and cryptocurrencies
  resources :exchanges do
    resources :cryptocurrencies, only: [:index]
  end

  # Resource routes for other entities
  resources :cryptocurrencies
  resources :transactions
end
