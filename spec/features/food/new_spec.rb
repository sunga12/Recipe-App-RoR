require 'rails_helper'

RSpec.describe 'Food New Page', type: :feature do
  describe 'Viewing Food New page' do
    before(:each) do
      @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit new_user_food_path(@user)
    end

    it 'Has input fields to fill in food item details' do
      expect(page).to have_field('food_name')
    end

    it 'Has a button to add food item' do
      expect(page).to have_button('Add Food')
    end

    it 'Has a button to Cancel operation' do
      expect(page).to have_link('Cancel')
    end

    it 'visiting the page from food list page, clicking cancel btn should redirect back to food list page' do
      visit user_foods_path(@user)
      click_button 'Add Food'
      click_link 'Cancel'
      expect(page).to have_current_path(user_foods_path(@user))
    end

    it 'filling correct inputs and then clicking Add food btn to add record and redirect to food list path' do
      fill_in 'food_price', with: '12'
      fill_in 'food_name', with: 'Test Name'
      click_button 'Add Food'
      expect(page).to have_current_path(user_foods_path(@user))
      expect(page.html).to have_content('Test Name')
      expect(page).to have_text('The food was saved successfully!')
    end
  end
end
