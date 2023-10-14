require 'rails_helper'

RSpec.describe 'Food Index Page', type: :feature do
  describe 'Viewing Food Index page' do
    describe 'Without adding foods' do
      before(:each) do
        @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
        @user.skip_confirmation!
        @user.save
        login_as(@user, scope: :user)

        visit user_foods_path(@user)
      end

      it 'No food sign is available' do
        expect(page.html).to have_content('No foods added yet!')
      end

      it 'Add food btn is available' do
        expect(page).to have_button('Add Food')
      end

      it 'When I click on Add Food btn, directs to add new food page' do
        click_button 'Add Food'
        expect(page).to have_current_path(new_user_food_path(@user))
      end
    end

    describe 'After adding food item' do
      before(:each) do
        @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
        @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, user_id: @user.id)
        @user.skip_confirmation!
        @user.save
        login_as(@user, scope: :user)

        visit user_foods_path(@user)
      end

      it 'I can see the user username.' do
        expect(page).to have_content(@food.name)
      end

      it 'When clicking Delete on a Food item, it should destroy food item' do
        click_link 'Delete'
        expect(page.html).to have_content('No foods added yet!')
      end
    end
  end
end
