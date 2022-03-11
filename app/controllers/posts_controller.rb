class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.three_recent_post
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new_post
    @user = User.find(params[:id])
  end

  def create_post
    @user = User.find(params[:id])
    @postt = params[:post]
    @newpost = Post.create(user_id: params[:id], title: @postt[:title], text: @postt[:text])
    @posts_list = @user.three_recent_post
    render :index
  end

  private

  def posts_params
    params.require(:posts).permit(:text)
  end
end
