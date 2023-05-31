class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @orders = Order.find_by(user_id: @user.id)
    authorize @orders
  end

  def new
    @order = Order.new
    @saxophone = Saxophone.find(params[:saxophone_id])
    # @user = @saxophone.user
    authorize @order
  end

  def create
    @saxophone = Saxophone.find(params[:saxophone_id])
    @order = Order.new(order_params)
    # @order.user = current_user
    if @order.save
      redirect_to saxophone_orders_path
    else
      render :new, status: :unprocessable_entity
    end
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:saxophone_id)
  end
end
