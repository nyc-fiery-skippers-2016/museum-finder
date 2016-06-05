class FavoritesController < ApplicationController

  def create
  	museum = Museum.find_by(id: params[:favorite][:museum_id])
   favorite = Favorite.find_or_create_by(user:current_user, museum: museum)
    redirect_to(:back)
  end

    def destroy
    Favorite.find_by(id: params[:id]).destroy
    redirect_to(:back)
  end

end