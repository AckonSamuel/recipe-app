Rails.application.routes.draw do
  # devise_for :users
  resources :users
  resources :foods
  resources :recipes do 
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  root 'foods#index'
  get '/general_shopping_list', to: 'foods#general'
  get '/public_recipes', to: 'recipes#public'
end
