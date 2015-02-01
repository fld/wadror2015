class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :year, numericality: { greater_than_or_equal_to: 1042,
											  only_integer: true }
  validate :not_in_the_future

  has_many :beers
  has_many :ratings, through: :beers

  def not_in_the_future
    if year > Date.today.year
      errors.add(:expiration_date, "can't be in the future")
    end
  end
end
