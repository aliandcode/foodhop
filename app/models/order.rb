class Order < ApplicationRecord
  belongs_to :dish_availability
  belongs_to :user
  monetize :amount_cents
end
