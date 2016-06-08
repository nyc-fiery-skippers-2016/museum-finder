class SearchController < ApplicationController

  def index
    if jump = jump_target
      redirect_to jump
    else
      @keyword = params[:keyword]
      @results = Search.for(params[:keyword])
    end
  end

  private
    def jump_target
      Museum.find_by(name: params[:keyword])
    end
end
