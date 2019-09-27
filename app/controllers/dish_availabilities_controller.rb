class DishAvailabilitiesController < ApplicationController
  def index
    if params[:query].present?
      PgSearch::Multisearch.rebuild(DishAvailability)
      # PgSearch::Multisearch.rebuild(Dish)
      # PgSearch::Multisearch.rebuild(User)
      @search_results = PgSearch.multisearch(params[:query])

      # building unique chefs
      @chefs_a = []
      @search_results.each do |result|
        @chefs_a << result.searchable.user
      end
      @chefs_a = @chefs_a.uniq
    else
      @dish_availabilities = DishAvailability.all.uniq(&:dish_id).sort_by {|availability| availability.dish.user.distance(current_user)}
      # @dish_availabilities.each do |d_a|
      #   d_a.address = d_a.dish.user.distance_from(current_user).round(1)
      # end
      # @dish_availability.order(address: :desc)

      @chefs = User.where(is_chef: true)
    end
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
      redirect_to chef_page_path
    else
      render :new
    end
  end

  def dish_availability_params
    params.require(:dish_availability).permit(:date, :portion_available, :price, :address)
  end
end
