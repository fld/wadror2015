class RatingsController < ApplicationController
  before_action :ensure_that_signed_in, except: [:index, :show]

  def index
    @ratings = Rating.all

    @top_ratings = Rails.cache.fetch("top 5 ratings", expires_in:10.minutes) do
      Rating.recent(5)
    end
 
    @top_beers = Rails.cache.fetch("top 5 beers", expires_in:10.minutes) do
      Beer.top(5)
    end

    @top_breweries = Rails.cache.fetch("top 5 breweries", expires_in:10.minutes) do
      Brewery.top(5)
    end

    @top_styles = Rails.cache.fetch("top 5 styles", expires_in:10.minutes) do
      Style.top(5)
    end

    @top_users = Rails.cache.fetch("top 5 users", expires_in:10.minutes) do
      User.active(5)
    end
  end

  def new
    @rating = Rating.new
    @beers =  Beer.all
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)

    if @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end  
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end
end
