class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :dishes
  has_many :reviews
  has_many :orders
  # has_many :dish_availabilities, through: dishes

  include PgSearch
  multisearchable against: %i[first_name last_name address]
end
