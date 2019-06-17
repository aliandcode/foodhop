# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

15.times do
  user = User.new
  user.name = Faker::Name.name
  user.address = Faker::Address.full_address
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.save!
end

60.times do
  dish = Dish.new
  dish.title = Faker::Food.dish
  dish.description = Faker::Food.description
  dish.user = User.all.sample
  dish.save!
end

60.times do
  review = Review.new
  review.stars = rand(1..5)
  review.comment = Faker::Restaurant.review
  review.user = User.all.sample
  review.dish = Dish.all.sample
  review.save!
end

60.times do
  dish_availability = Dish_availability.new
  dish_availability.date = Date.parse(Faker::Date.between(20.days.ago, Date.today))
  dish_availability.portion_available = "#{rand(1..12)} servings"
  dish_availability.dish = Dish.all.sample
  dish_availability.save!
end




