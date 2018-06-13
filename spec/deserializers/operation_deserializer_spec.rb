require 'rails_helper'

RSpec.describe Deserializers::Operation do
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
  subject { Deserializers::Operation.new.call(params) }
  its([:value]) { is_expected.to eq(value) }
  its([:datetime]) { is_expected.to eq(datetime) }
end
