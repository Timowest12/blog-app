class LikesController < ApplicationController
  def new_like
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @newlike = Like.new(post: @post, user_id: 1)
    if @newlike.save
      redirect_to "/users/#{params[:user_id]}/posts", flash: { notice: 'Liked!' }
    else
      redirect_to "/users/#{params[:user_id]}/posts", flash.now[:error] = "Error, couldn't be liked!"
    end
  end
end
