class RestaurantsController < ApplicationController
  before_filter :require_signed_in!, :except => [:index]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.save
      redirect_to restaurant_url(@restaurant)
    else
      render :json => @restaurant.errors.full_messages
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      redirect_to restaurant_url(@restaurant)
    else
      render :json => @restaurant.errors.full_messages
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @city = City.find(params[:city_id])
    @restaurants = @city.restaurants.sort_by{ |rest| rest.average_rating}.reverse
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to restaurants_url
  end
end
