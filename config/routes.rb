Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books
  resources :users, only: [:edit, :update]
end
