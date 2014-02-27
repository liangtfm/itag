class FollowsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @follow = current_user.followed.new
    @follow.followed_id = @user.id

    if @follow.save
      redirect_to user_url(@follow.followed)
    else
      render json: @follow.errors.full_messages
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.followed.where("followed_id = ?", @user.id)
    @follow.first.destroy
    redirect_to user_url(@follow.first.followed)
  end

end
