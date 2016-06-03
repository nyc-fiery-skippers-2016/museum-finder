class UsersController < ApplicationController
before_action :current_user

  def show
  	if user_signed_in?
  		id = current_user.id
  		# binding.pry
    	@user = User.find_by(id: params[:id])
    else
    	redirect_to root_path
    end
  end

end



