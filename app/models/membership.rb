class Membership < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_one :beerclub, dependent: :destroy
end
