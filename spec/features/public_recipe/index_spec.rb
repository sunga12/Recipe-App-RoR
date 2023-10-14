require 'rails_helper'

RSpec.describe 'Public Recipe Index Page', type: :feature do
  describe 'Viewing page' do
    describe 'No public recipes' do
      before(:each) do
        @user = User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
        @user.skip_confirmation!
        @user.save
        login_as(@user, scope: :user)

        visit root_path
      end

      it 'has title' do
        expect(page.html).to have_content('Public Recipes')
      end

      it 'has no recipe records' do
        expect(page.html).to_not have_content('By')
      end
    end

    describe 'At least one public recipe' do
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

        visit root_path
      end

      it 'recipe name is available' do
        expect(page).to have_content(@recipe.name)
      end
    end
  end
end
