class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
    
  end

  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'Recipe Saved Successfully!'
          redirect_to recipes_path(user_id: current_user)
        else
          flash.now[:error] = 'Error: Recipe could not be saved'
          render :new
        end
      end
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path(user_id: current_user)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
