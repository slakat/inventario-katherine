require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

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
