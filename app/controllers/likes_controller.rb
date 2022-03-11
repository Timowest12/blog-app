class LikesController < ApplicationController
  def new_like
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @newlike = Like.create(post: @post, user_id: 1)
    redirect_to "/users/#{params[:user_id]}/posts"
  end
end
