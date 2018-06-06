class Operation < ApplicationRecord
  belongs_to :user
  validates :value, presence: true
  validates :datetime, presence: true

  after_create :increase_balance
  after_destroy :decrease_balance

  private

  def increase_balance
    user.balance += value
    user.save!
  end

  def decrease_balance
    user.balance -= value
    user.save!
  end
end
