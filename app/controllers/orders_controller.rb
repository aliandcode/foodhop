class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @dish_availability = DishAvailability.find(params[:dish_availability_id])
  end

  def create
    @dish_availability = DishAvailability.find(params[:dish_availability_id])
    @order = Order.new
    @order.dish_availability = @dish_availability
    raise
    # @order.user = current_user
    # raise

    if @order.save
      redirect_to new_dish_availability_order_payment_path(@order)
    else
      render :new
    end
  end
end
