class User < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beerclubs, through: :memberships
  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, :format => {:with => /.*(?=.{4,})(?=.*\d)(?=.*[A-Z]).*/, message: ">=4 characters, 1 caps, 1 digit"}
end
