FactoryGirl.define do
  factory :task do
    title Faker::Name.title
    body  Faker::Lorem.sentence
    user
    admin
  end
  factory :other_task do
    title Faker::Name.title
    body  Faker::Lorem.sentence
    transient do
      user
    end
    admin
  end
end
