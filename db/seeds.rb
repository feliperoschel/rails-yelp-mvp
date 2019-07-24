# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up 'restaurant' table..."
Restaurant.destroy_all if Rails.env.development?

puts "Creating new restaurants..."
category = ["chinese", "italian", "japanese", "french", "belgian"]

10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: category.sample
  )
  5.times do
    restaurant.reviews.new(
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
  end
  restaurant.save
end

puts "Created #{Restaurant.count} restaurants"
