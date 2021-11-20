Rails.application.routes.draw do
  resources :posts
  resources :news
  root "root#index"
  devise_for :users
  resources :accounts
end