# db/seeds.rb
require "open-uri"
require "json"

puts "Cleaning database..."
Flat.destroy_all

puts "Fetching flats..."
url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
flats_serialized = URI.parse(url).read
flats = JSON.parse(flats_serialized)

puts "Creating #{flats.length} flats with pictures..."
flats.each do |flat_data|
  Flat.create!(
    name: flat_data["name"],
    address: "123 Fake Street, London",
    description: "A wonderful stay featuring a great location, amazing lighting, and beautiful modern amenities.",
    price_per_night: flat_data["price"],
    number_of_guests: rand(2..5),
    picture_url: flat_data["imageUrl"] # <-- Grabbing the image URL here!
  )
end
puts "Finished!"
