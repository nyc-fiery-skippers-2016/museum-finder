class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # binding.pry
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def home
    @art = Category.find_by(name: "Art")
    @history = Category.find_by(name: "History")
    @science = Category.find_by(name: "Science")
    @childrens = Category.find_by(name: "Children's")
    @cultural = Category.find_by(name: "Cultural")
    @outdoor = Category.find_by(name: "Outdoor")
    @favorite = Favorite.new
  end

  def show
    @category = Category.find_by(id: params[:id])
    @favorite = Favorite.new
  end

end
