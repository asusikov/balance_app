require 'rails_helper'

RSpec.describe "Operations", type: :request do
  let(:user) { create :user }
  describe "GET /user/:id/operations" do
    let!(:user_operations) { create_list :operation, 5, user: user }
    let!(:operations) { create_list :operation, 5 }
    describe "status of response" do
      subject { get(user_operations_path(user.id)); response }
      it { is_expected.to have_http_status(:success) }
    end
    describe "numbers of users" do
      subject do
        get user_operations_path(user.id)
        JSON.parse(response.body)['data'].length
      end
      it { is_expected.to eq(user_operations.length) }
    end
  end

  describe "POST /user/:id/operations" do
    let(:value) { 50 }
    let(:datetime) { DateTime.now }
    let(:request_params) do
      {
        params: {
          data: {
            type: 'operations',
            attributes: {
              value: value,
              datetime: datetime
            }
          }
        }
      }
    end
    describe "status of response" do
      subject do
        post user_operations_path(user.id), request_params
        response
      end
      it { is_expected.to have_http_status(:created) }
      context 'when value is nil and datatime is nil' do
        let(:value) { nil }
        let(:datetime) { nil }
        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
    describe 'result' do
      subject { -> { post user_operations_path(user.id), request_params } }
      it { is_expected.to change(user.operations, :count).by(1) }
    end
  end

  describe "DELETE /user/:user_id/operations/:id" do
    let!(:operation) { create :operation, user: user }
    describe "statue of response" do
      subject { delete user_operation_path(user.id, operation.id); response }
      it { is_expected.to have_http_status(:no_content) }
    end
    describe "result" do
      subject { -> { delete user_operation_path(user.id, operation.id) } }
      it { is_expected.to change(user.operations, :count).by(-1) }
    end
  end
end
