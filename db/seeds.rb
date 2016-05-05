
# generates the 10 mandatory pose tags
poses = ["Front Relaxed", "Side Relaxed", "Back Relaxed", "Front Double Biceps", "Side Chest", "Side Triceps", "Rear Lat Spread", "Back Double Biceps", "Front Abs & Thigh", "Most Muscular"]

poses.each do |pose|
  Tag.create!(name: pose)
end

# Creates a new athlete to which all of the subsequent models belong
athlete = User.create!(email: "example@example.com", name: Faker::Name.name, gender: "M", age: 32, bio: Faker.hipster.sentence, height: 68, phone_number: 3175555555)

# Creates a new prep
prep = athlete.prep.create!(title: "2016 Summer Competition Season")

# Creates a new contest
prep.contest.create!(title: "WNBF Pro Bowl", date: (Time.now + 7257600))

# Creates 30 days of weigh-ins
weight = 2050
counter = 2592000
30.times do
  bw = prep.bodyweights.create!(weight: weight)
  bw.created_at -= counter
  bw.save!
  weight -= rand(0..7)
  counter -= 86400
end

# Creates 30 days of target macros
counter = 2592000
10.times do
  macros = prep.target_macros.create!(protein: 250, carbs: 300, fat: 60)
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end
10.times do
  macros = prep.target_macros.create!(protein: 250, carbs: 275, fat: 55)
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end
10.times do
  macros = prep.target_macros.create!(protein: 230, carbs: 250, fat: 50)
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end

# Creates 30 days of macros
counter = 2592000
10.times do
  macros = prep.macros.create!(protein: rand(240..260), carbs: rand(280..325), fat: rand(52..68))
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end
10.times do
  macros = prep.macros.create!(protein: rand(240..260), carbs: rand(260..295), fat: rand(49..60))
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end
10.times do
  macros = prep.macros.create!(protein: rand(220..260), carbs: rand(235..265), fat: rand(45..55))
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end

# creates 4 weeks of tagged progress photos, one for each tag every week
counter = 2592000
5.times do
  10.times do |i|
    photo = prep.photos.create!(image: URI.parse(Faker::Avatar.image))
    photo.created_at -= counter
    photo.save!
    Tagging.create!(photo_id: photo.id, tag_id: i+1)
  end
  counter -= 604800
end
