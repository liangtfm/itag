class ReviewsController < ApplicationController
  before_filter :require_signed_in!

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @restaurant.open == false
      render json: "That restaurant is closed!"
    end
  end

  def create
    @review = current_user.reviews.new(params[:review])
    @review.restaurant_id = params[:restaurant_id]

    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render json: @review.errors.full_messages
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to user_url(@review.user)
    else
      render json: @review.errors.full_messages
    end
  end

  def index
    @reviews = Review.all
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to user_url(@review.user)
  end
end