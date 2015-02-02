class Beer < ActiveRecord::Base
  include RatingAverage

  validates :name, presence: true

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  def to_s
    "#{self.name} by #{self.brewery.name}"
  end
end
