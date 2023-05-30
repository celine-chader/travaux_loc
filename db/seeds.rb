# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"


puts "starting seeding"

15.times do
  user = User.new(
    email: Faker::Internet.email, password: "123456" ,first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.full_address
    )
  user.save!
  3.times do
    file = URI.open(Faker::LoremFlickr.image(size: "400x400"))
    ad = Ad.new(
      name: Faker::Construction.heavy_equipment,
      category: Ad::CATEGORIES.sample,
      description: Faker::Lorem.paragraph(sentence_count: 4),
    )
    ad.photo.attach(io: file, filename: "#{ad.name}.png", content_type: "image/png")
    ad.user = user
    ad.save!
  end
end

puts "finished seeding"
