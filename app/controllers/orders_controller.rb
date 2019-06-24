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
    @order = Order.new(orders_params)
    @order.dish_availability = @dish_availability
    @order.user = current_user
    @order.status = 'pending'
    @order.amount = 10

    if @order.save
      redirect_to new_order_payment_path(@order)
    else
      render :new
    end
  end

  private
  def orders_params
        params.require(:order).permit(:dishes_portion, :comment)
  end
end
