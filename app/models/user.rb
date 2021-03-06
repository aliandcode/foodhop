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
  mount_uploader :photo, PhotoUploader

  include PgSearch
  multisearchable against: %i[first_name last_name address]

  def distance(other_user)
    distance_from(other_user)&.round(1)
  end
end
