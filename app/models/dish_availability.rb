class DishAvailability < ApplicationRecord
  belongs_to :dish
  has_many :orders
end
