require 'rails_helper'

describe User do
  describe "favorite beer" do
    let(:user){ FactoryGirl.create(:user) }

    it "has method for determining the favorite_beer" do
      user = FactoryGirl.create(:user)
      expect(user).to respond_to(:favorite_beer)
    end

    it "does not have one without ratings" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryGirl.create(:beer)
      rating = FactoryGirl.create(:rating, beer:beer, user:user)

      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      create_beers_with_ratings(10, 20, 15, 7, 9, user)
      best = create_beer_with_rating(25, user)

      expect(user.favorite_beer).to eq(best)
    end
  end

  describe "favorite style and brewery" do
    let!(:user) { FactoryGirl.create :user }
    let!(:brewery1) { FactoryGirl.create :brewery, name:"Koff" }
    let!(:brewery2) { FactoryGirl.create :brewery, name:"Olvi" }
    let!(:beer1) { FactoryGirl.create :beer, name:"Iso L", brewery:brewery1, style:'Lager' }
    let!(:beer2) { FactoryGirl.create :beer, name:"Iso I", brewery:brewery2, style:'IPA' }
    let!(:rating1) { FactoryGirl.create :rating, user:user, beer:beer1, score:10 }
    let!(:rating2) { FactoryGirl.create :rating, user:user, beer:beer2, score:5 }

    it "has working methods for determining them" do
      #byebug
      expect(user.favorite_style).to eq('Lager')
      expect(user.favorite_brewery).to eq(brewery1)
    end
  end

  describe "with a proper password" do
    let(:user){ FactoryGirl.create(:user) }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct average rating" do
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)
    end
  end
end

def create_beer_with_rating(score, user)
  beer = FactoryGirl.create(:beer)
  FactoryGirl.create(:rating, score:score, beer:beer, user:user)
  beer
end

def create_beers_with_ratings(*scores, user)
  scores.each do |score|
    create_beer_with_rating(score, user)
  end
end