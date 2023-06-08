class RelationshipsController < ApplicationController
  def create 
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to "/users/#{params[:user_id]}/profiles"
  end

  
end
