class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.user = User.all.sample
    if @dish.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:title, :description, :photo)
  end
end
