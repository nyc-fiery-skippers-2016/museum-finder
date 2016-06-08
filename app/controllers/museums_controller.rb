class MuseumsController < ApplicationController

  def show
    @museum = Museum.find_by(id: params[:id])
    user_id= current_user.id
    @favorite = Favorite.new
  end


end
