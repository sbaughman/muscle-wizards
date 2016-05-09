FactoryGirl.define do
  factory :photo do
    image URI.parse(Faker::Avatar.image)
  end
end
