class DishAvailabilitiesController < ApplicationController
  def index
    @dish_availabilities = DishAvailability.all
    @chefs = User.where(is_chef: true)
  end

  def show
    @dish_availability = DishAvailability.find(params[:id])
    @dish = @dish_availability.dish
    @chef = @dish.user
    @order = Order.new
  end
end
