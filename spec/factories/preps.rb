FactoryGirl.define do
  factory :prep do
    title   Faker::StarWars.quote
    user_id Random.new.rand(1..10)
  end
end
