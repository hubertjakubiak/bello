FactoryGirl.define do
  factory :board do
    title Faker::Lorem.sentence 
    association :owner, factory: :user
  end
end