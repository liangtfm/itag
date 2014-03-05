class FavoritesController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = current_user.favorites.new
    @favorite.restaurant_id = @restaurant.id
    @favorite.save

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render "restaurants/show"
    else
      redirect_to restaurant_url(@favorite.restaurant)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = current_user.favorites.where("restaurant_id = ?", @restaurant.id)
    @favorite.first.destroy

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render "restaurants/show"
    else
      redirect_to restaurant_url(@favorite.first.restaurant)
    end
  end

end
