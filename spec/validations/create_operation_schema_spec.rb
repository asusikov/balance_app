require 'rails_helper'

RSpec.describe Validations::CreateOperationSchema do
  let(:value) { 20.0 }
  let(:datetime) { DateTime.now }
  describe '#success' do
    subject { described_class.call(value: value, datetime: datetime).success? }
    context 'when value presences' do
      let(:value) { 20.0 }
      it { is_expected.to be_truthy }
    end
    context 'when value does not presence' do
      let(:value) { nil }
      it { is_expected.to be_falsey }
    end
    context 'when value is not float' do
      let(:value) { '20' }
      it { is_expected.to be_falsey }
    end
    context 'when datetime presences' do
      let(:datetime) { DateTime.now }
      it { is_expected.to be_truthy }
    end
    context 'when datetime does not presence' do
      let(:datetime) { nil }
      it { is_expected.to be_falsey }
    end
    context 'when datetime is not DateTime' do
      let(:datetime) { 'DateTime' }
      it { is_expected.to be_falsey }
    end
  end
end
