module RatingAverage
  def average_rating
    ratings.average(:score).to_s
  end
end
