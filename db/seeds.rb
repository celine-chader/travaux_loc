# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

puts "destroying all bookings"
Booking.destroy_all

puts "destroying all ads"
Ad.destroy_all

puts "destroying all users"
User.destroy_all

puts "starting seeding"

15.times do
  user = User.new(
    email: Faker::Internet.email, password: "123456" ,first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
    )
  user.save!
  3.times do
    file = URI.open(Faker::LoremFlickr.image(size: "400x400", search_terms: ['tools']))
    ad = Ad.new(
      name: Faker::Construction.heavy_equipment,
      category: Ad::CATEGORIES.sample,
      description: Faker::Lorem.paragraph(sentence_count: 4),
      address: Faker::Address.full_address,
      price: (10..1000).to_a.sample
    )
    ad.photos.attach(io: file, filename: "#{ad.name}.png", content_type: "image/png")
    ad.user = user
    ad.save!
    2.times do
      booking = Booking.new(
        start_date: ["2023-06-12", "2023-06-04", "2023-06-02", "2023-06-08", "2023-06-07", "2023-06-11"].sample,
        end_date: ["2023-06-13", "2023-06-16", "2023-07-01", "2023-06-20", "2023-06-15", "2023-07-03"].sample,
      )
      booking.ad = Ad.all.sample
      booking.user = User.all.sample
      booking.save!
    end
  end
end

puts "finished seeding"
