# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'date'

Review.destroy_all
Order.destroy_all
DishAvailability.destroy_all
Dish.destroy_all
User.destroy_all

cook_category = ["hobbyist", "professional cook"]

15.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = "123456"
  user.address = Faker::Address.full_address
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.category = cook_category[rand(0..1)]
  user.bio = Faker::Restaurant.description
  user.is_chef = Faker::Boolean.boolean

  user.save!
end

allergens = ["Cereals containing gluten", "Crustaceans", "Eggs", "Fish", "Peanuts", "Soybeans", "Milk", "Nuts", "Celery", "Mustard", "Sesame seeds", "Sulphur dioxide and sulphites", "Lupin", "Molluscs"]
cuisine = []

60.times do
  dish = Dish.new
  dish.title = Faker::Food.dish
  dish.ingredients = Faker::Food.description
  dish.user = User.where(is_chef: true).sample
  dish.allergens = allergens[rand(0..14)]
  dish.cuisine = [Faker::Restaurant.type]
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
  dish_availability = DishAvailability.new
  dish_availability.date = Time.at(rand * (Time.now.to_f - 0.0.to_f))
  dish_availability.portion_available = "#{rand(1..12)} servings"
  dish_availability.dish = Dish.all.sample
  dish_availability.price = rand(25..200)/10.0
  dish_availability.save!
end

80.times do
  order = Order.new
  order.user = User.all.sample
  order.dish_availability = DishAvailability.all.sample
  order.status = ["pending", "archived"][rand(0..1)]
  order.save!
end



