FactoryGirl.define do
  factory :contest do
    title   Faker::Superhero.name
    date    Random.new.rand(2.month..4.months).seconds.from_now
    prep_id Random.new.rand(1..10)
  end
end
