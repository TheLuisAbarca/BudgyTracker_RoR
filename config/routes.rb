Rails.application.routes.draw do
  resources :entities
  devise_for :users
  root to: 'home#index'
  resources :users, only: [:index]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
