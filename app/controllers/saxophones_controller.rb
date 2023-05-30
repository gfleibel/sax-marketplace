class SaxophonesController < ApplicationController
  before_action :set_saxophone, only: %i[show edit update]

  def index
    @saxophones = Saxophone.all
  end

  def show
  end

  def user_saxophones
    @user = User.find(params[:user_id])
    @saxophones = @user.saxophones
    # @saxophones = Saxophone.where(user: @user)
  end

  def new
    @saxophone = Saxophone.new
  end

  def create
    @saxophone = Saxophone.new(saxophone_params)
    @saxophone.save

    redirect_to saxophone_path(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def saxophone_params
    params.require(:saxophone).permit(:title, :price, :manufacturer, :category, :sax_model, :condition, :serial_number, :details, status: false)
  end

  def set_saxophone
    @saxophone = Saxophone.find(params[:id])
  end
end
