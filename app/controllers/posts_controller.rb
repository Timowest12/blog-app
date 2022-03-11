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
    # render html: '<div>html goes here</div>'.html_safe
  end

  def new_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new_like
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @newlike = Like.create(post: @post, user_id: 1)
    render :index
  end

  def create_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = params[:comment]
    @newcomment = Comment.create(post: @post, user_id: 1, text: @comment[:text])
    render :index
  end
end
