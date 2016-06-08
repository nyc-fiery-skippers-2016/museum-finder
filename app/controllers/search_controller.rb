class SearchController < ApplicationController

  def index
    if jump = jump_target
      redirect_to jump
    else
      @results = Search.for(params[:keyword]) && Search.for_address(params[:keyword])
      @favorite = Favorite.new
    end
  end

  private
    def jump_target
      Museum.find_by(name: params[:keyword])
    end
end
