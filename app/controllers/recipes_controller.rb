class RecipesController < ApplicationController
  def index
    @user = User.find(current_user.id)
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
          redirect_to recipe_path(@recipe), notice: 'The recipe was saved successfully!'
        else
          flash.now[:error] = 'Error: Recipe could not be saved'
          render :new
        end
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_public_params)
      redirect_to recipe_path(@recipe), notice: 'Public status has been changed successfully.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path(user_id: current_user), notice: 'The food was deleted successfully!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end

  def recipe_public_params
    params.require(:recipe).permit(:public)
  end
end
