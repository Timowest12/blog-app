class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
    @allusers = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts_list = @user.three_recent_post
  end

  def new_like
    @user = User.find(params[:user_id])
  end
end
