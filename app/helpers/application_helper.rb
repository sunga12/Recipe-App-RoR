module ApplicationHelper
  def recipe_price(recipe)
    total_price = 0
    recipe.recipe_foods.each do |recipe_food|
      total_price += recipe_food.quantity * Food.find(recipe_food.food_id).price
    end
    total_price
  end
end
