class FavoritesController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = current_user.favorites.new
    @favorite.restaurant_id = @restaurant.id

    if @favorite.save
      redirect_to restaurant_url(@favorite.restaurant)
    else
      render json: @favorite.errors.full_messages
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = current_user.favorites.where("restaurant_id = ?", @restaurant.id)
    @favorite.first.destroy
    redirect_to restaurant_url(@favorite.first.restaurant)
  end

end
