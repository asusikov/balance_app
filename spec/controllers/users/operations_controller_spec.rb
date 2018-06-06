require 'rails_helper'

RSpec.describe Users::OperationsController, type: :controller do
  let(:user) { create :user }
  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
