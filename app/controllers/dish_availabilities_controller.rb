class DishAvailabilitiesController < ApplicationController
  def index
    if params[:query].present? || params[:query2].present?
      PgSearch::Multisearch.rebuild(DishAvailability)
      PgSearch::Multisearch.rebuild(Dish)
      PgSearch::Multisearch.rebuild(User)
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
end
