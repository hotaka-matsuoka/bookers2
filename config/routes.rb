Rails.application.routes.draw do
  get 'top' => 'top#top'
  root 'top#top'
  devise_for :users
  resources :books
  resources :users, only: [:edit, :update]
end
