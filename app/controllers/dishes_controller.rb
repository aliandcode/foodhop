class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    cld_photo = Cloudinary::Uploader.upload(params[:dish][:photo])
    @dish.photo = cld_photo["url"]
    @dish.user = current_user
    if @dish.save!
      redirect_to chef_page_path
    else
      render :new
    end
  end

  def show
    @dish = Dish.find(params[:id])
    @order = Order.new
  end

  def dish_params
    params.require(:dish).permit(:title, :ingredients, :photo, :allergens, :cuisine)
  end
end
