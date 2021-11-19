Rails.application.routes.draw do
  devise_for :users
  # users controller
  get 'users/new', to: "users#new"
  post 'users/create', to: "users#create"
end