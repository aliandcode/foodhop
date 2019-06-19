class DishAvailabilitiesController < ApplicationController
  def index
    @dish_availabilities = DishAvailability.all
    @chefs = User.where(is_chef: true).all
  end

  def show
    @dish_availability = DishAvailability.find(params[:id])
    @order = Order.new
  end
end
