# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe '#destroy' do
    subject { -> { operation.destroy } }

    let!(:user) { create :user }
    let!(:operation) { create :operation, user: user, value: 20 }

    it { is_expected.to change(user, :balance).by(-20) }
  end
end
