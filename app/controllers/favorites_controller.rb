class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new
    @favorite.restaurant_id = params[:restaurant_id]

    if @favorite.save
      redirect_to restaurant_url(@favorite.restaurant)
    else
      render json: @favorite.errors.full_messages
    end
  end

  def destroy
    @favorite = current_user.favorites.where("restaurant_id = ?", params[:restaurant_id])
    @favorite.first.destroy
    redirect_to restaurant_url(@favorite.first.restaurant)
  end

end
