class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def make_chef
    @user = current_user
    @user.is_chef = true
    @user.save

    redirect_to chef_page_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
