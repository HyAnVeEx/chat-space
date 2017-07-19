Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
end
