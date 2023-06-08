class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id).order('created_at DESC') 
    if Profile.where(user_id: @user.id).exists?
    @profile = Profile.where(user_id: @user.id)
    end
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
    params.require(:profile).permit(:shop, :prefecture_id, :customer_id, :price_id, :country_id, :introduction).merge(user_id: current_user.id)
  end
end
