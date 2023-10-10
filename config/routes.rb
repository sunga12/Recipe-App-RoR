Rails.application.routes.draw do
  resources :users, only:[:index], shallow: true do
    resources :foods, only: [:index, :create, :new, :destroy]
    resources :recipes
  end
  resources :recipes, shallow: true do
    resources :recipe_foods, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :general_shopping_list, only: [:index]
  end
  resources :public_recipes, only: [:index]
  root "users#index"
end
