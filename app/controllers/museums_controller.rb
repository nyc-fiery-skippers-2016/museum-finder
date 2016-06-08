class MuseumsController < ApplicationController

  def show
    @museum = Museum.find_by(id: params[:id])
    @favorite = Favorite.new
  end


end
