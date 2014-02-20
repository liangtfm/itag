class RestaurantsController < ApplicationController
  before_filter :require_signed_in!, :except => [:index]

  def new
    @city = City.find(params[:city_id])
    @restaurant = @city.restaurants.new
  end

  def create
    @city = City.find(params[:city_id])
    @restaurant = @city.restaurants.new(params[:restaurant])

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
    @restaurant = Restaurant.includes(:reviews, :categories, :city, :state, :users_who_favorited).find(params[:id])
  end

  def index
    @city = City.includes(restaurants: [:reviews]).find(params[:city_id])
    @restaurants = @city.restaurants.sort_by{ |rest| rest.average_rating}.reverse
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to restaurants_url
  end

  def search
    @restaurants = Restaurant.includes(:categories).where("city_id = ?", params[:city_id])

    @category = Category.find(params[:cat_id])

    @restaurants.select! { |rest| rest.categories.include?(@category) }

    return @restaurants
  end

end
