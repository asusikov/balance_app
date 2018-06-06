require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    let!(:users) { create_list :user, 5 }
    describe 'status of response' do
      subject do
        get(users_path)
        response
      end
      it { is_expected.to have_http_status(:success) }
    end
    describe 'numbers of users' do
      subject do
        get(users_path)
        parsed_body = JSON.parse(response.body)
        parsed_body['data'].length
      end
      it { is_expected.to eq(users.length) }
    end
  end
end
