Rails.application.routes.draw do
  resources :allergies
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  resources :users
  get '/', to: 'application#home', as: "home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
