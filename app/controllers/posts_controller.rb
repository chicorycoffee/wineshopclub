class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :destroy]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    if @post.save
      redirect_to root_path
    else
      render :new
    end
    end

    def show
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to post_path(@post.id)
      else
        render :edit
      end
    end

    def destroy 
      @post.destroy if current_user.id == @post.user.id
      redirect_to root_path
    end
  
private

def post_params
  params.require(:post).permit(:title, :name, :importer, :genre_id, :country_id, :type_id, :taste_id, :grape_id, :price_id, :text, :image).merge(user_id: current_user.id)
end

def set_post
  @post = Post.find(params[:id])
end

def move_to_root
  return unless current_user.id != @post.user.id

  redirect_to root_path
end
end

