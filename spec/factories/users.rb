# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "User #{n}"
    end
    balance 120
  end
end
