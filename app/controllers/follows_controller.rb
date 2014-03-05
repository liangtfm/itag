class FollowsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @follow = current_user.followed.new
    @follow.followed_id = @user.id
    @follow.save

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render "users/show"
    else
      redirect_to user_url(@follow.followed)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.followed.where("followed_id = ?", @user.id)
    @follow.first.destroy

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render "users/show"
    else
      redirect_to user_url(@follow.first.followed)
    end
  end

end
