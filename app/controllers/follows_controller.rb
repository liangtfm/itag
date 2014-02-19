class FollowsController < ApplicationController

  def create
    @follow = current_user.followed.new
    @follow.followed_id = params[:user_id]

    if @follow.save
      redirect_to user_url(@follow.followed)
    else
      render json: @follow.errors.full_messages
    end
  end

  def destroy
    @follow = current_user.followed.where("followed_id = ?", params[:user_id])
    @follow.first.destroy
    redirect_to user_url(@follow.first.followed)
  end

end
