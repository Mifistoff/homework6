FactoryGirl.define do
  factory :comment do
    body   Faker::Lorem.sentence
    task
    author
  end
end
