Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index], shallow: true do
    resources :foods, only: [:index, :create, :new, :destroy]
    resources :recipes
  end
  resources :recipes, shallow: true do
    resources :recipe_foods, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :general_shopping_list, only: [:index]
  end
  resources :public_recipes, only: [:index]
  root to: "public_recipes#index"
end
