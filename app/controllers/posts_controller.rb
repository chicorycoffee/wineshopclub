class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
    end
  
private

def post_params
  params.require(:post).permit(:title, :name, :importer, :genre_id, :country_id, :type_id, :taste_id, :grape_id, :price_id, :text, :image).merge(user_id: current_user.id)
end
end

