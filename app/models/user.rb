class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dishes
  has_many :reviews
  has_many :orders

  include PgSearch
  multisearchable against: %i[first_name last_name]
end
