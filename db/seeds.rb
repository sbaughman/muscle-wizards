# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

poses = ["Front Relaxed", "Side Relaxed", "Back Relaxed", "Front Double Biceps", "Side Chest", "Side Triceps", "Rear Lat Spread", "Back Double Biceps", "Front Abs & Thigh", "Most Muscular"]

def picture_from_url(url)
  URI.parse(url)
end

poses.each do |pose|
  Tag.create!(name: pose)
end

athlete = User.create!(email: "example@example.com", name: Faker::Name.name, gender: "M", age: 32, bio: Faker.hipster.sentence, height: 68, phone_number: 3175555555)

prep = athlete.prep.create!(title: "2016 Summer Competition Season")

prep.contest.create!(title: "WNBF Pro Bowl", date: (Time.now + 7257600))

weight = 2050
counter = 22592000
30.times do
  bw = prep.bodyweights.create!(weight: weight)
  bw.created_at -= counter
  bw.save!
  weight -= rand(0..7)
  counter -= 86400
end
