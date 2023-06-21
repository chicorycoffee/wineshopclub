class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :create, :update]
  before_action :redirect, only: [:new, :edit]

  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id).order('created_at DESC')
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @likes_list = Post.find(likes)

    return unless Profile.where(user_id: @user.id).exists?
    @profile = Profile.where(user_id: @user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new(user_id: @user.id)
  end

  def edit
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to "/users/#{@profile.user.id}/profiles"
    else
      render :edit
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to "/users/#{@profile.user.id}/profiles"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:shop, :prefecture_id, :customer_id, :price_id, :country_id,
                                    :introduction).merge(user_id: current_user.id)
  end

  def redirect
    @user = User.find(params[:user_id])
    return if current_user == @user

    redirect_to "/users/#{params[:user_id]}/profiles"
  end
end
