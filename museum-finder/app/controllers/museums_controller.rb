class MuseumsController < ApplicationController

  def show
    @film = Film.find_by(id: params[:id])
  end

end
