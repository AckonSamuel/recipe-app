Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :general_shopping_lists
  resources :public_recipes
  resources :foods
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
