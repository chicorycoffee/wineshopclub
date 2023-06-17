class CommentChannel < ApplicationCable::Channel
  def subscribed
    @post = Post.find(params[:post_id])
    stream_for @post

    stream_from 'comment_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
