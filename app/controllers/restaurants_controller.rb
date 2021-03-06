class RestaurantsController < ApplicationController

  def index
    if params[:search].present?
      if params[:search][:number_of_reviews].present? &&
        params[:search][:number_of_reviews].match(/\d/)
        @number_of_reviews = params[:search][:number_of_reviews]
      end
      @restaurant = Restaurant.get(params[:search][:name])
      @reviews = @restaurant.reviews.limit(@number_of_reviews || 9) if @restaurant

      if @reviews.present?
        @avg_rating = (@reviews.pluck(:rating).reduce(:+) / @reviews.size.to_f).round(2)
      end
    end
  end

end
