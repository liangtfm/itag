class VoteTagsController < ApplicationController
  def create
    @votetag = current_user.vote_tags.new
    @votetag.review_id = params[:review_id]
    @votetag.vote_id = 1

    if @votetag.save
      redirect_to restaurant_url(@votetag.review.restaurant)
    else
      render json: @votetag.errors.full_messages
    end
  end

  def destroy
    @votetag = current_user.vote_tags.where("review_id = ?", params[:review_id])
    @votetag.first.destroy
    redirect_to restaurant_url(@votetag.first.review.restaurant)
  end
end
