class DishAvailability < ApplicationRecord
  belongs_to :dish
  has_many :orders

  include PgSearch
  multisearchable against: %i[address date]
end
