FactoryGirl.define do
  factory :bodyweight do
    weight  Random.new.rand(180..210)
  end
end
