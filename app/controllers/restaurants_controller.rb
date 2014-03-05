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
    @restaurant = Restaurant.find(params[:id])
    # Restaurant.includes(:reviews, :categories, :city, :state, :users_who_favorited).find(params[:id])
  end

  def index
    @city = City.find(params[:city_id])

    @restaurants = @city.restaurants.select("restaurants.*, AVG(reviews.rating) AS avg_rating")
                        .joins("LEFT JOIN reviews ON reviews.restaurant_id = restaurants.id")
                        .group("restaurants.id")
                        .order("avg_rating DESC NULLS LAST")
                        .page(params[:page])
                        .per(5)

    @reviews = Review.select("reviews.*")
                     .joins("JOIN restaurants ON reviews.restaurant_id = restaurants.id")
                     .joins("JOIN cities ON cities.id = restaurants.city_id")
                     .where("cities.id = ?", @city.id)
                     .group("reviews.id")
                     .order("reviews.created_at")
                     .last(5)
                     .reverse!
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to restaurants_url
  end

  def search
    @results = PgSearch.multisearch(params[:query])

    if @results.empty?
      return []
    elsif Category.all.include?(@results.first.searchable)
      @category = @results.first.searchable
        .restaurants.where("city_id = ?", params[:city_id])
        .sort!{ |a, b| a.average_rating <=> b.average_rating }
        .reverse!

      @restaurants = Kaminari.paginate_array(@category)
                             .page(params[:page])
                             .per(10)
    else
      @restaurants = @results.map(&:searchable).sort!{ |a, b| a.average_rating <=> b.average_rating }.reverse!

      @restaurants = Kaminari.paginate_array(@restaurants).page(params[:page]).per(10)
    end

    # @restaurants = Restaurant.includes(:categories).where("city_id = ? AND categories.id = ?", params[:city_id], params[:cat_id]).page(params[:page])
  end

end
