class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.three_recent_post
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
