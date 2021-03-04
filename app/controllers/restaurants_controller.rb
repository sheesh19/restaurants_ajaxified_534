class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    # enables JSON data to be returned when we have a JSON request
    respond_to do |format|
      format.html
      format.json { render json: { restaurants: @restaurants.count } }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end
end
