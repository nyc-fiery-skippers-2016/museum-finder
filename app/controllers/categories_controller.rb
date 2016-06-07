class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    # PANSAMPANSAM
    # Do you need to respond to both here?
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def home
    # PANSAMPANSAM
    # This should be a single query. Are these "featured"
    # categories? If so, you could write a class method on
    # Category that returns these. `Category.all_featured`
    @art = Category.find_by(name: "Art")
    @history = Category.find_by(name: "History")
    @science = Category.find_by(name: "Science")
    @childrens = Category.find_by(name: "Children's")
    @cultural = Category.find_by(name: "Cultural")
    @outdoor = Category.find_by(name: "Outdoor")
    # PANSAMPANSAM
    # Why do you need to instantiate favorite objects everywhere?
    @favorite = Favorite.new
  end

  def show
    @category = Category.find_by(id: params[:id])
    # PANSAMPANSAM
    # Why do you need to instantiate favorite objects everywhere?
    @favorite = Favorite.new
  end

end
