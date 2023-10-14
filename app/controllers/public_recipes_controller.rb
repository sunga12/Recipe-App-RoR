class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true).order('created_at DESC')
    # @recipe_foods = RecipeFood.all
    # @foods = Food.all
  end
end
