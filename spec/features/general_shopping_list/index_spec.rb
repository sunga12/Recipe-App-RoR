require 'rails_helper'

RSpec.describe 'General Shopping List Index Page', type: :feature do
  describe 'No shopping list items available' do
    before(:each) do
      @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit general_shopping_list_index_path
    end

    it 'has title' do
      expect(page.html).to have_content('Shopping List')
    end

    it 'show no item available' do
      expect(page.html).to have_content('Your shopping list is empty!')
    end
  end

  describe 'At least one recipe added with recipe_food items more than available items' do
    before(:each) do
      @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
      @recipe = Recipe.create(name: 'Lasagna',
                              description: 'Mince, Cheese, Milk, seasoned, baked, italian',
                              preparation_time: 1.5,
                              cooking_time: 2.5,
                              public: true,
                              user_id: @user.id)
      @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, user_id: @user.id)
      @recipe_food = RecipeFood.create(quantity: 10, food_id: @food.id, recipe_id: @recipe.id)
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit general_shopping_list_index_path
    end

    it 'recipe name is available' do
      expect(page).to have_content(@food.name)
    end
  end
end
