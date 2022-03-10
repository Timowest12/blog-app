class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.three_recent_post
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new_like
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    newlike = Like.create(post: @post, user_id: 1 )

    render :index
  end

  def create_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = params[:comment]
    newcomment = Comment.create(post: @post, user_id: 1, text: @comment[:text] )
    render :index
  end
end
