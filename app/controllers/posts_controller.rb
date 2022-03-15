class PostsController < ApplicationController
  def delete
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    Like.where(user_id: post.user_id).destroy_all
    user.posts_counter -= 1
    post.destroy
    user.save
    redirect_to "/users/#{params[:user_id]}/posts", flash: { notice: 'post deleted!' }
  end

  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new_post
    @user = User.find(params[:id])
  end

  def create_post
    @post = current_user
    @user = User.find(params[:id])
    @postt = params[:post]
    @newpost = Post.create(user_id: params[:id], title: @postt[:title], text: @postt[:text])
    @posts_list = @user.three_recent_post
    if @newpost.save
      render :index, flash: { notice: 'Success! Post has been created!' }
    else
      render :new_post, flash: { notice: 'Success! Post has been created!' }
    end
  end

  private

  def posts_params
    params.require(:posts).permit(:text)
  end
end
