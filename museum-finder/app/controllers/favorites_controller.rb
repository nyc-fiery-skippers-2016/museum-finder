class FavoritesController < ApplicationController

  def create
   favorite = Favorite.find_or_create_by(user:current_user, museum: museum)
    redirect_to categories_path
  end

    def destroy
    Favorite.find_by(id: params[:id]).destroy
    redirect_to categories_path
  end

end