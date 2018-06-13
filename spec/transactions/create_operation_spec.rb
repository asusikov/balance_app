require 'rails_helper'

RSpec.describe Transactions::CreateOperation do
  let(:user_id) { 12 }
  let(:create_operation_schema) { double('create_operation_schema') }
  describe '#success' do
    before do
      Dependicies::Container.register(:create_operation_schema, create_operation_schema)
      allow(create_operation_schema).to receive(:call).and_return(Dry::Monads.Success(user_id: user_id))
    end
    subject { described_class.new.call(user_id: user_id).success? }
    it { is_expected.to be_truthy }
    # context 'when validation schema failed' do
    #   before { allow(create_operation_schema).to receive(:call).and_return(Dry::Monads.Failure(:validation)) }
    #   it { is_expected.to be_falsey }
    # end
  end
end
