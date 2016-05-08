FactoryGirl.define do
  factory :target_macro do
    protein { Random.new.rand(180..234) }
    carbs   { Random.new.rand(170..200) }
    fat     { Random.new.rand(58..71) }
    fiber   { Random.new.rand(28..40) }
    prep    { Prep.new(title: Faker::Superhero.name, user_id: build_stubbed(:user)) }
  end
end

# Define a master prep and a bunch of data before every test run?
# By saving to database ahead of time?
