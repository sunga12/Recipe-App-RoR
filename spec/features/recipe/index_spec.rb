require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :feature do
  describe 'Viewing page' do
    describe 'Without adding recipes' do
      before(:each) do
        @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
        @user.skip_confirmation!
        @user.save
        login_as(@user, scope: :user)

        visit user_recipes_path(user_id: @user.id)
      end

      it 'title available' do
        expect(page.html).to have_content('Recipes')
      end

      it 'Add recipe btn is available' do
        expect(page).to have_button('New Recipe')
      end

      it 'When I click on Add Food btn, directs to add new food page' do
        click_button 'New Recipe'
        expect(page).to have_current_path(new_user_recipe_path(@user))
      end
    end

    describe 'After adding food item' do
      before(:each) do
        @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
        @recipe = Recipe.create(name: 'Lasagna',
                                description: 'Mince, Cheese, Milk, seasoned, baked, italian',
                                preparation_time: 1.5,
                                cooking_time: 2.5,
                                public: true,
                                user_id: @user.id)
        @user.skip_confirmation!
        @user.save
        login_as(@user, scope: :user)

        visit user_recipes_path(user_id: @user.id)
      end

      it 'I can see the user username.' do
        expect(page).to have_content(@recipe.name)
      end

      it 'remove recipe btn is available' do
        expect(page).to have_button('REMOVE')
      end
    end
  end
end
