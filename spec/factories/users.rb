FactoryGirl.define do
  factory :user do
    name      { Faker::Superhero.name }
    email     { Faker::Internet.email }
    age       { Random.new.rand(18..45) }
    height    { Random.new.rand(60..90) }
    gender    { %w(M F).sample }
    password  { Faker::Internet.password(8) }
  end
end
