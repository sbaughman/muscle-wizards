FactoryGirl.define do
  factory :macro do
    protein { Random.new.rand(180..234) }
    carbs   { Random.new.rand(170..200) }
    fat     { Random.new.rand(58..71) }
    fiber   { Random.new.rand(28..40) }
    prep    { Prep.new(title: Faker::Superhero.name, user_id: build_stubbed(:user)) }
  end
end
