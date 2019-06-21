class DishAvailabilitiesController < ApplicationController
  def index
    if params[:query].present? || params[:query2].present?
      PgSearch::Multisearch.rebuild(DishAvailability)
      # PgSearch::Multisearch.rebuild(Dish)
      # PgSearch::Multisearch.rebuild(User)
      @search_results = PgSearch.multisearch(params[:query])
    else
      @dish_availabilities = DishAvailability.all
      @chefs = User.where(is_chef: true)
    end
  end

  def show
    @dish_availability = DishAvailability.find(params[:id])
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
