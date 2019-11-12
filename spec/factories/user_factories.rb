FactoryBot.define do
  factory :user do
    name { "John Doe" }
    sequence :username do |n|
      "john_doe_#{n}"
    end
  end
end
