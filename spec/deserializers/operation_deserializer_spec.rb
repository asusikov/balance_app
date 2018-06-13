require 'rails_helper'

RSpec.describe Deserializers::OperationDeserializer do
  let(:value) { 50 }
  let(:datetime) { DateTime.now }
  let(:params) do
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
  subject { described_class.new.call(params) }
  its([:value]) { is_expected.to eq(value) }
  its([:datetime]) { is_expected.to eq(datetime) }
end
