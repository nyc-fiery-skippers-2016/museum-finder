class FavoritesController < ApplicationController

  def create
  	museum = Museum.find_by(id: params[:favorite][:museum_id])
   favorite = Favorite.find_or_create_by(user:current_user, museum: museum)
    render plain: "Yay created"
  end

   def destroy
   	fave = Favorite.find_by(user: current_user, museum_id: params[:favorite][:museum_id])
   	if fave
   		fave.destroy
   		if request.xhr?
   			render json: {success: true}
   		else
   			redirect_to :back
   		end
   	else
   		render plain: "Whatchoo doing. Ain't no fave there!"
   	end
  end
    
end