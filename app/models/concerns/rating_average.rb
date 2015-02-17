module RatingAverage
  extend ActiveSupport::Concern

  #def average_rating
  #  ratings.map(&:score).sum.to_f/ratings.count
  #end

  def average_rating
    ratings.average(:score).to_f.round(2)
  end
end
