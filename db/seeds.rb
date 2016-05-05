
# generates the 10 mandatory pose tags
poses = ["Front Relaxed", "Side Relaxed", "Back Relaxed", "Front Double Biceps", "Side Chest", "Side Triceps", "Rear Lat Spread", "Back Double Biceps", "Front Abs & Thigh", "Most Muscular"]

poses.each do |pose|
  Tag.create!(name: pose)
end

# Creates a new athlete to which all of the subsequent models belong
athlete = User.create!(email: "example@example.com", name: Faker::Name.name, gender: "M", age: 32, bio: Faker::Hipster.sentence, height: 68, phone_number: 3175555555, password: "password", avatar: URI.parse("https://i.ytimg.com/vi/mwOQNfBBqSc/hqdefault.jpg"))

# Creates a new prep
prep = athlete.preps.create!(title: "2016 Summer Competition Season")

# Creates a new contest
prep.contests.create!(title: "WNBF Pro Bowl", date: (Time.now + 7257600))

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
  macros = prep.macros.create!(protein: rand(220..240), carbs: rand(235..265), fat: rand(45..55))
  macros.created_at -= counter
  macros.save!
  counter -= 86400
end

# creates 30 days of target_cardios
counter = 2592000
10.times do
  cardios = prep.target_cardios.create!(duration: 15, activity: "Stairclimber", style: "HIIT")
  cardios.created_at -= counter
  cardios.save!
  counter -= 86400
end
10.times do
  cardios = prep.target_cardios.create!(duration: 25, activity: "Bike", style: "HIIT")
  cardios.created_at -= counter
  cardios.save!
  counter -= 86400
end
10.times do
  cardios = prep.target_cardios.create!(duration: 45, activity: "Stairclimber", style: "LISS")
  cardios.created_at -= counter
  cardios.save!
  counter -= 86400
end

# creates 30 days of cardio logs
counter = 2592000
10.times do
  cardios = prep.cardios.create!(duration: rand(12..18), activity: "Stairclimber", style: "HIIT")
  cardios.created_at -= counter
  cardios.save!
  counter -= 86400
end
10.times do
  cardios = prep.cardios.create!(duration: rand(22..30), activity: "Bike", style: "HIIT")
  cardios.created_at -= counter
  cardios.save!
  counter -= 86400
end
10.times do
  cardios = prep.cardios.create!(duration: rand(40..50), activity: "Stairclimber", style: "LISS")
  cardios.created_at -= counter
  cardios.save!
  counter -= 86400
end

# creates 5 weeks of tagged progress photos, one for each tag every week
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
