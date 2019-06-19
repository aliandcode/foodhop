class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def make_chef
    @user = current_user
    @user.is_chef = true
    @user.save

    redirect_to dish_availabilities_path
  end
end
