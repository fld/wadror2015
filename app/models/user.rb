class User < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beerclubs, through: :memberships
  has_secure_password

  validates :username, uniqueness: true, length: { in: 3..15 }
  validates :password, :format => { :with => /.*(?=.{4,})(?=.*\d)(?=.*[A-Z]).*/, 
                                     message: ">=4 characters, 1 caps, 1 digit" }
  validates :admin, inclusion: {in: [true, false]}
  validates :enabled, inclusion: {in: [true, false]}

  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?
    styles = ratings.group_by { |r| r.beer.style }
    return top_average(styles)
  end

  def favorite_brewery
    return nil if ratings.empty?
    breweries = ratings.group_by { |r| r.beer.brewery }
    return top_average(breweries)
  end

  # http://stackoverflow.com/questions/1341271/how-do-i-create-an-average-from-a-ruby-array
  def top_average(list)
    list.keys.each do |k|   
      result = list[k].inject(0.0) { |s, r| s + r.score } / list[k].size
      list[k] = result
    end
    return list.max_by { |a, b| b }[0]
  end

  def self.active(n)
    most_active = User.all.sort_by{ |u| -(u.ratings.count||0) }
    most_active.first(n)
  end
end
