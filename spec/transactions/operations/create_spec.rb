# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transactions::Operations::Create do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:create_operation_schema) { double('create_operation_schema') }
  let(:validation_result) { double('validation_result', success?: validation_is_success) }
  let(:validation_is_success) { true }
  let(:operation_params) do
    {
      value: 50,
      datetime: Time.now
    }
  end
  before(:each) do
    allow(create_operation_schema).to receive(:call).and_return(validation_result)
  end

  describe '#success' do
    subject { described_class.new(create_operation_schema: create_operation_schema).call(transaction_params).success? }

    let(:transaction_params) { { user_id: user_id, operation_params: operation_params } }
    it { is_expected.to be_truthy }

    context 'when validation schema failed' do
      let(:validation_is_success) { false }
      it { is_expected.to be_falsey }
    end

    context 'when user is not presented' do
      let(:user_id) { user.id + 1 }
      it { is_expected.to be_falsey }
    end

    context 'when value is string' do
      let(:operation_params) do
        {
          value: '50',
          datetime: Time.now
        }
      end
      it { is_expected.to be_truthy }
    end
  end

  describe 'result' do
    subject do
      lambda do
        described_class.new(create_operation_schema: create_operation_schema).call(transaction_params)
        user.reload
      end
    end

    let(:transaction_params) { { user_id: user_id, operation_params: operation_params } }
    it { is_expected.to change(user, :balance).by(50) }
  end
end
