class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def new
    @order = Order.new
    @dish_availability = DishAvailability.find(params[:dish_availability_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @dish_availability = DishAvailability.find(params[:dish_availability_id])
    @order = Order.new
    @order.dish_availability = @dish_availability
    @order.user = current_user

    if @order.save
      redirect_to dish_availability_order_path(@dish_availability, @order)
    else
      render :new
    end
  end
end
