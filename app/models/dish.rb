class Dish < ApplicationRecord
  monetize :price_cents
  belongs_to :user
  has_many :reviews
  has_many :dish_availabilities
  validates :title, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch
  multisearchable against: %i[title ingredients cuisine allergens]
end
