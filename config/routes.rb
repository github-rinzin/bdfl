Rails.application.routes.draw do
  resources :invoices, only: [:create, :index, :update]
  resources :roles
  resources :accounts
  resources :outlets
  resources :products
  resources :posts
  resources :news
  devise_for :users

  root "root#index"
  post "role", to: "root#changeRole", as: "changerole"
  post "deliver/invoice", to: "root#deliver_product", as: "deliver"
  
end