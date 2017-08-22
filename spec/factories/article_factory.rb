FactoryGirl.define do
  factory :article do
    title Faker::StarTrek.character
    content Faker::ChuckNorris.fact
    language "python"
    user Faker::Internet.unique.email
  end
end
