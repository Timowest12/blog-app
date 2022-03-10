class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
    @posts_list = @user.three_recent_post
  end

  def new_like
    @user = User.find(params[:user_id])
  end

  def create_post
    @user = User.find(params[:id])
    @postt = params[:post]
    @newpost = Post.create(user_id: params[:id], title: @postt[:title], text: @postt[:text])
    @posts_list = @user.three_recent_post
    render :show
  end
end
