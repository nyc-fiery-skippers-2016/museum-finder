class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

end
