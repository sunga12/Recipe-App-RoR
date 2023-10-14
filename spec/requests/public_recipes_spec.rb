require 'rails_helper'

RSpec.describe 'Public Recipes', type: :request do
  describe 'GET /index' do
    before { get root_path }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('index')
    end

    it 'renders the right action' do
      expect(response.body).to include('<p>Here is a list of public recipes for all users</p>')
    end
  end
end
