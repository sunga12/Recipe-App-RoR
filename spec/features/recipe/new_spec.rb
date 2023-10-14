require 'rails_helper'

RSpec.describe 'Recipe New Page', type: :feature do
  describe 'Viewing page' do
    before(:each) do
      @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit new_user_recipe_path(@user)
    end

    it 'Has input fields to fill in recipe item details' do
      expect(page).to have_field('recipe_name')
      expect(page).to have_field('recipe_description')
      expect(page).to have_field('recipe_preparation_time')
      expect(page).to have_field('recipe_cooking_time')
    end

    it 'Has a button to add food item' do
      expect(page).to have_button('Create Recipe')
    end

    it 'filling correct inputs and then clicking Add food btn to add record and redirect to food list path' do
      fill_in 'recipe_name', with: 'recipe name'
      fill_in 'recipe_description', with: 'testing'
      fill_in 'recipe_preparation_time', with: '1.5'
      fill_in 'recipe_cooking_time', with: '2.5'
      click_button 'Create Recipe'
      expect(page).to have_text('The recipe was saved successfully!')
      expect(page).to have_text('recipe name')
    end
  end
end
