FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "User #{n}"
    end
  end
end
