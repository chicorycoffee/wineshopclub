class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.create(comment_params)
    @post = Post.find(params[:post_id])
    return unless @comment.save

    CommentChannel.broadcast_to @post, { comment: @comment, user: @comment.user }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if current_user.id == @comment.user.id
    @comment.destroy 
    end
    redirect_to post_path(id: @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
