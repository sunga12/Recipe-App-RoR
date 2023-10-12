require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: 'Jackson') }

    before { get user_recipes_path(user.id) }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response.body).to include('<p>Here is a list of recipes for a given user</p>')
    end

    it 'renders the right action' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'Jason') }
    let(:recipe) do
      Recipe.create(
        name: 'Spaghetti Bolognaise',
        description: 'spaghetti, meatballs, sauce',
        preparation_time: 1.5,
        cooking_time: 2.5,
        public: true,
        user_id: user.id
      )
    end

    before do
      get recipe_path(recipe.id)
    end

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('show')
    end

    it 'renders the right action' do
      expect(response.body).to include('<p>Here is a recipe for a given user</p>')
    end
  end
end
