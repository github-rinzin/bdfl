Rails.application.routes.draw do
  devise_for :customers
  resources :invoices, only: [:create]
  # resources :roles
  resources :accounts
  resources :outlets
  resources :products
  resources :posts
  resources :news
  devise_for :users
  root "root#index"
end