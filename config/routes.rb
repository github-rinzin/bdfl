Rails.application.routes.draw do
  resources :accounts
  resources :outlets
  resources :products
  resources :posts
  resources :news
  devise_for :users
  root "root#index"
end