class Operation < ApplicationRecord
  belongs_to :user
  validates :value, presence: true
  validates :datetime, presence: true
end
