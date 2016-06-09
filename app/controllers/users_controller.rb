class UsersController < ApplicationController
before_action :current_user

  def show
 	if signed_in?
	  @user = current_user
	else
	  redirect_to root_path
	end
  end

end



