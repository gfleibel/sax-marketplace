class SaxophonesController < ApplicationController
  before_action :set_saxophone, only: %i[show edit update]

  def index
    @saxophones = policy_scope(Saxophone)
  end

  def show
    authorize @saxophone
  end

  def user_saxophones
    @user = User.find(params[:user_id])
    @saxophones = policy_scope(Saxophone).where(user_id: @user.id)
  end

  def new
    @saxophone = Saxophone.new
    authorize @saxophone
  end

  def create
    @saxophone = Saxophone.new(saxophone_params)
    @saxophone.user = current_user
    if @saxophone.save
      redirect_to saxophone_path(@saxophone)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @saxophone
  end

  def edit
    authorize @saxophone
  end

  def update
    authorize @saxophone
  end

  def destroy
    authorize @saxophone
  end

  private

  def saxophone_params
    params.require(:saxophone).permit(:title, :price, :manufacturer, :category, :sax_model, :condition, :serial_number, :photo, :details, status: false)
  end

  def set_saxophone
    @saxophone = Saxophone.find(params[:id])
  end
end
