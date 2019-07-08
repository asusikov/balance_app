# frozen_string_literal: true

class Operation < ApplicationRecord
  belongs_to :user

  after_destroy :decrease_balance

  private

  def decrease_balance
    user.balance -= value
    user.save!
  end
end
