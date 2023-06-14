class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :destroy]

  def index
    @post1 = Post.where(genre_id: 2).includes(:user).order('created_at DESC').limit(3)
    @post2 = Post.where(genre_id: 3).includes(:user).order('created_at DESC').limit(3)
    @post3 = Post.where(genre_id: 4).includes(:user).order('created_at DESC').limit(3)
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

    def show
      @comment = Comment.new
      @comments = @post.comments.includes(:user)
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

    def hot
      @posts = Post.where(genre_id: 2).includes(:user).order('created_at DESC')
    end

    def next
      @posts = Post.where(genre_id: 3).includes(:user).order('created_at DESC')
    end

    def wanted
      @posts = Post.where(genre_id: 4).includes(:user).order('created_at DESC')
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

