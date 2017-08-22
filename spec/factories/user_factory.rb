FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.unique.email + "#{n}" }
    password Faker::Internet.password

    trait :admin do
      admin true
    end
  end
end
