class SearchController < ApplicationController

  def index
    if jump = jump_target
      redirect_to jump
    else
      @results = Search.for(params[:keyword])
      @favorite = Favorite.new
    end
  end

  private
  # PANSAMPANSAM
  # I don't know what "jump target" means
  # Is this semantic to you? Will you know what this means in
  # 6 months time?
    def jump_target
      Museum.find_by(name: params[:keyword])
    end
end
