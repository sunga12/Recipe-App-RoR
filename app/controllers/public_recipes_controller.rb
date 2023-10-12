class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true).order('created_at DESC')
  end
end
