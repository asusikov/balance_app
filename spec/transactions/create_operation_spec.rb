require 'rails_helper'

RSpec.describe Transactions::CreateOperation do
  let(:user_id) { 12 }
  let(:create_operation_schema) { double('create_operation_schema') }
  let(:validation_result) { double('validation_result', success?: validation_is_success)}
  let(:validation_is_success) { true }
  before(:each) do
    allow(create_operation_schema).to receive(:call).and_return(validation_result)
  end
  describe '#success' do
    subject { described_class.new(create_operation_schema: create_operation_schema).call(user_id: user_id).success? }
    it { is_expected.to be_truthy }
    context 'when validation schema failed' do
      let(:validation_is_success) { false }
      it { is_expected.to be_falsey }
    end
  end
end
