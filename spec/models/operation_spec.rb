require 'rails_helper'

RSpec.describe Operation, type: :model do

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:datetime) }

  describe "#create" do
    let!(:user) { create :user }
    subject { -> { Operation.create! user: user, value: 20, datetime: DateTime.now } }
    it { is_expected.to change(user, :balance).by(20) }
  end

  describe "#destroy" do
    let!(:user) { create :user }
    let!(:operation) { create :operation, user: user, value: 20 }
    subject { -> { operation.destroy } }
    it { is_expected.to change(user, :balance).by(-20) }
  end
end
