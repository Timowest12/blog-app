class CommentsController < ApplicationController
  def delete
    comment = Comment.find(params[:comment_id])
    # user = User.find(post.user_id)
    # Comment.find(user_id: params[:comment_id]).destroy
    comment.destroy
    # user.posts_counter -= 1
    redirect_to "/users/#{params[:user_id]}/posts", flash: { notice: 'post deleted!' }
  end

  def new_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = params[:comment]
    @newcomment = Comment.create(post: @post, user_id: current_user.id, text: @comment[:text])
    redirect_to "/users/#{params[:user_id]}/posts", flash: { notice: 'Comment created!' }
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
