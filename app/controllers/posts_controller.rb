class PostsController < ApplicationController

private

def post_params
  params.require(:post).permit(:title, :name, :importer, :genre_id, :country_id, :type_id, :taste_id, :grape_id, :price_id, :text, :image).merge(user_id: current_user.id)
end
