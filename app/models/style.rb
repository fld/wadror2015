class Style < ActiveRecord::Base
  include RatingAverage

  validates :name, presence: true
  validates :desc, presence: true

  has_many :beers, :dependent => :destroy
  has_many :ratings, through: :beers

  def to_s
    self.name
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Style.all.sort_by{ |s| -(s.average_rating||0) }
    sorted_by_rating_in_desc_order.first(n)
  end
end
