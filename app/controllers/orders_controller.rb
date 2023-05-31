class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @orders = Order.where(user_id: user.id)
    authorize @orders
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @oder = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @order
  end

  private

  def set_order
    params.require(:order).permit(:user_id, :saxophone_id)
  end
end
