class FavoritesController < ApplicationController

  def create
  end

  def destroy
  end



  def create
   @project = Project.find_by(id: params[:favorite][:project_id])
   favorite = Favorite.find_or_create_by(user:current_user, project: @project)
    redirect_to projects_path
  end

    def destroy
    Favorite.find_by(id: params[:id]).destroy
    redirect_to projects_path
  end

end