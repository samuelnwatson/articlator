FactoryGirl.define do
  factory :article do
    title Faker::TheFreshPrinceOfBelAir.character
    content Faker::ChuckNorris.fact
    language "python"
  end
end
