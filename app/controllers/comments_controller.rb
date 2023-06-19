class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user)
    @comment = Comment.create(comment_params)
    @comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user)
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
