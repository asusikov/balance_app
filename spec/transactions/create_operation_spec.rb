require 'rails_helper'

RSpec.describe Transactions::CreateOperation do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:create_operation_schema) { double('create_operation_schema') }
  let(:validation_result) { double('validation_result', success?: validation_is_success)}
  let(:validation_is_success) { true }
  let(:transaction_dependencies) do
    {
      create_operation_schema: create_operation_schema,
      operation_deserializer: Deserializers::OperationDeserializer
    }
  end
  let(:params) do
    {
      params: {
        data: {
          type: 'operations',
          attributes: {
            value: 50,
            datetime: Time.now
          }
        }
      }
    }
  end
  before(:each) do
    allow(create_operation_schema).to receive(:call).and_return(validation_result)
  end
  describe '#success' do
    subject { described_class.new(transaction_dependencies).call(user_id: user_id, params: params).success? }
    it { is_expected.to be_truthy }
    context 'when validation schema failed' do
      let(:validation_is_success) { false }
      it { is_expected.to be_falsey }
    end
    context 'when user is not presented' do
      let(:user_id) { user.id + 1 }
      it { is_expected.to be_falsey }
    end
  end
end
