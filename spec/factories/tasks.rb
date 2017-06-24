FactoryGirl.define do
  factory :task do
    title       Faker::Name.title
    body        Faker::Lorem.sentence
    association :user
    association :admin
  end
end
