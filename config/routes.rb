require 'sidekiq/web'

Rails.application.routes.draw do
  get 'reports', to: 'reports#index'

  get 'reports/download'

  resources :transactions
  resources :categories
  resources :formulas
  resources :products
  resources :extra_products
  resources :services
  root 'reports#index'

  post '/creating-transaction', to: 'transactions#creating_transaction'
  post '/transaction-details', to: 'transactions#transaction_details'
  post '/transaction-preview', to: 'transactions#transaction_preview'
  get '/product-price', to: 'products#product_price'
  get '/extra-price', to: 'extra_products#extra_price'

  devise_for :users

  # Examples:
  #
  # resources :products do
  #   member do
  #     get 'short'
  #     post 'toggle'
  #   end
  #
  #   collection do
  #     get 'sold'
  #   end
  #
  #   resources :comments, :sales
  # end

  get '/styleguide', to: "styleguide#show"

  mount Sidekiq::Web => (ENV['SIDEKIQ_PATH'] || '/sidekiq')
end
