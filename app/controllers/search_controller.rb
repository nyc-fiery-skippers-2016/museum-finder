class SearchController < ApplicationController

  def index
    @keyword = params[:keyword]
    @results = Search.for(params[:keyword])
  end
    
end
