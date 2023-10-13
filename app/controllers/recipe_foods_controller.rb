class RecipeFoodsController < ApplicationController
  # GET /recipe_foods/new
  def new
    @recipe_id = params[:recipe_id]
    @recipe_food = Recipe.find(@recipe_id).recipe_foods.new
    @food_list = Food.where.not(id: RecipeFood.where(recipe_id: @recipe_id).pluck(:food_id))
  end

  # POST /recipe_foods
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to new_recipe_recipe_food_path(@recipe_food.recipe_id), notice: 'The ingredient was added successfully!'
    else
      redirect_to new_recipe_recipe_food_path(@recipe_food.recipe_id), notice: 'The ingredient was not added.'
    end
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_id = @recipe_food.recipe_id
    @food_list = Food.where(id: @recipe_food.food_id)
    @edit = true
  end

  # PATCH/PUT /recipe_foods/1
  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'The ingredient was edited successfully!'
    else
      redirect_to edit_recipe_food_path(@recipe_food), notice: 'The ingredient was not edited'
    end
  end

  # DELETE /recipe_foods/1
  def destroy
    recipe_food = RecipeFood.find(params[:id])
    recipe = Recipe.find(recipe_food.recipe_id)
    recipe_food.destroy!
    redirect_to recipe_path(recipe.id), notice: 'Recipe food was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
