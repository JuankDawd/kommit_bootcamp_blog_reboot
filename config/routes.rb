Rails.application.routes.draw do
  devise_for :users

  root 'articles#index'

  resources :users
  resources :relationships
  resources :articles do
    resources :comments
  end
end
