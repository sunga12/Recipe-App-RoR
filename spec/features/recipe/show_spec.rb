require 'rails_helper'

RSpec.describe 'Recipe show Page', type: :feature do
  describe 'Viewing page' do
    before(:each) do
      @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
      @recipe = Recipe.create(name: 'Lasagna',
                              description: 'Mince, Cheese, Milk, seasoned, baked, italian',
                              preparation_time: 1.5,
                              cooking_time: 2.5,
                              user_id: @user.id)
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit recipe_path(@recipe)
    end

    describe 'With no recipe food' do
      it 'I can see the user username.' do
        expect(page).to have_content(@recipe.name)
      end

      it 'Has a button to add Recipe Ingredient' do
        expect(page).to have_button('Add Ingredient')
      end

      it 'has a switch to change recipe status to public' do
        expect(page).to have_unchecked_field('recipe[public]')
      end

      it 'public switch can be checked to be true' do
        check('recipe[public]')
        expect(page).to have_checked_field('recipe[public]')
      end

      it 'When clicking Delete on a Food item, it should destroy food item' do
        click_button 'Add Ingredient'
        expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe))
      end
    end

    describe 'With at least recipe food' do
      before(:each) do
        @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, user_id: @user.id)
        @recipe_food = RecipeFood.create(quantity: 30,
                                         food_id: @food.id,
                                         recipe_id: @recipe.id)

        @user.skip_confirmation!
        @user.save
        login_as(@user, scope: :user)

        visit recipe_path(@recipe)
      end

      it 'Can see recipe food ingredient name' do
        expect(page).to have_content(@food.name)
      end

      it 'Has buttons to modify and dellete Recipe Ingredients' do
        expect(page).to have_link('Modify')
        expect(page).to have_link('Delete')
      end

      it 'When clicking Delete, it should destroy food item' do
        click_link 'Delete'
        expect(page).to_not have_content(@food.name)
      end
    end
  end
end
