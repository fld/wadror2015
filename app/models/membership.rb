class Membership < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :beerclub, dependent: :destroy
end
