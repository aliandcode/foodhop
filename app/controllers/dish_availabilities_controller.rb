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

  def new
    @dish = Dish.find(params[:dish_id])
    @dish_availability = DishAvailability.new
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @dish_availability = DishAvailability.new(dish_availability_params)
    @dish_availability.dish = @dish
    if @dish_availability.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def dish_availability_params
    params.require(:dish_availability).permit(:date, :portion_available, :price, :address)
  end
end
