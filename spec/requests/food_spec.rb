require 'rails_helper'

RSpec.describe 'Food', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: 'Jackson') }

    before { get user_foods_path(user_id: user.id) }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('index')
    end

    it 'renders the right action' do
      expect(response.body).to include('<p>Here is a list of foods for a given user</p>')
    end
  end
end
