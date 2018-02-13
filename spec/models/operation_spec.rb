require 'rails_helper'

RSpec.describe Operation, type: :model do
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:datetime) }
end
