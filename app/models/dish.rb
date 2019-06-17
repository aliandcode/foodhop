class Dish < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :dish_availabilities
end
