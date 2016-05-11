FactoryGirl.define do
  factory :message do
    body "MyText"
    user nil
    conversation nil
    read false
  end
end
