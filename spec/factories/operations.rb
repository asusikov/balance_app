# frozen_string_literal: true

FactoryBot.define do
  factory :operation do
    value '9.99'
    datetime '2018-02-13 09:27:51'
    association :user
  end
end
