class DishAvailability < ApplicationRecord
  belongs_to :dish
  belongs_to :user
  has_many :orders

  include PgSearch
  multisearchable against: %i[address date]
end
