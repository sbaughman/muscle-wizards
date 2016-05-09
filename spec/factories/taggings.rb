FactoryGirl.define do
  # 5.times do FactoryGirl.build_stubbed(:photo) end
  # 5.times do FactoryGirl.build_stubbed(:tag) end
  factory :tagging do
    association :photo
    association :tag
  end
end

# photo_id  { Photo.offset(Random.new.rand(Photo.count)).first } # random photo
# tag_id    { Tag.offset(Random.new.rand(Tag.count)).first }    # random tag
