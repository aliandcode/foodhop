class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home; end

  def dashboard
    @user = current_user
  end

  def chef_page
    @user = current_user
    @dishes = @user.dishes
    @dish_availability = DishAvailability.new
  end
end
