# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

poses = ["Front Relaxed", "Side Relaxed", "Back Relaxed", "Front Double Biceps", "Side Chest", "Side Triceps", "Rear Lat Spread", "Back Double Biceps", "Front Abs & Thigh", "Most Muscular"]

poses.each do |pose|
  Tag.create!(name: pose)
end
