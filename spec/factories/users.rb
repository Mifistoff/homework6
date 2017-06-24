FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.unique.email("Nancy_#{n}") }
    password         Faker::Internet.password(8)
  end
end
