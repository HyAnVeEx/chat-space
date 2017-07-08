Rails.application.routes.draw do
  root 'messages#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :edit, :create]
  resources :groups, only: [:new, :edit, :create, :update]
end
