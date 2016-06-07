class MuseumsController < ApplicationController

  def show
    @museum = Museum.find_by(id: params[:id])
  end

  # PANSAMPANSAM
  # Clean up your whitespace throughout your files.
end
