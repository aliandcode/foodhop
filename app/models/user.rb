class User < ApplicationRecord
  has_many :dishes
  has_many :reviews
  has_many :orders
end
