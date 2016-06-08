class FavoritesController < ApplicationController

  def create
    museum = Museum.find_by(id: params[:favorite][:museum_id])
    favorite = Favorite.find_or_create_by(user:current_user, museum: museum)
    if favorite.save
      if request.xhr?
        render partial: './favorite', layout: false, locals: {museum: museum, favorite: favorite}
      else
        redirect_to :back
      end
    else
      render plain: "That didn't work"
    end
  end

  def destroy
    fave = Favorite.find_by(user: current_user, museum_id: params[:favorite][:museum_id])
   	museum = Museum.find_by(id: params[:favorite][:museum_id])
    if fave
   		if fave.destroy
     		if request.xhr?
     			render partial: './favorite', layout: false, locals: {museum: museum, favorite: fave}
     		else
     			redirect_to :back
     		end
      end
   	else
   		render plain: "Whatchoo doing. Ain't no fave there!"
   	end
  end
    
end