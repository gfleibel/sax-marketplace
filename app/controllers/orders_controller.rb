class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @orders = Order.where(user_id: @user.id)
    @saxophones = policy_scope(Saxophone).where(user_id: @user.id)
  end

  def sales
    @user = current_user
    @saxophones = policy_scope(Saxophone)
    @sold_saxophones = @saxophones.where(user_id: @user.id, status: true)
    @sold_orders = []
    if @sold_saxophones.present?
      @sold_saxophones.each do |sax|
        @sold_orders << Order.find_by(saxophone_id: sax.id)
      end
    end
    @sold_orders
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
    @saxophone.status = true
    if @order.save && @saxophone.save
      redirect_to user_orders_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:saxophone_id, :user_id)
  end
end
