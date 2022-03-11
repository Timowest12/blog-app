class LikesController < ApplicationController
  
  def new_like
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @newlike = Like.create(post: @post, user_id: 1)
    # render :index
    # render html: '<div>html goes here</div>'.html_safe
    redirect_to "/users/#{params[:user_id]}/posts"
  end

end
