class SaxophonesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @saxophone = Saxophone.new
  end

  def create
    @saxophone = Saxophone.new(saxophone_params)
    @saxophone.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def saxophone_params
    params.require(:saxophone).permit(:title, :manufacturer, :category, :sax_model, :condition, :serial_number, :details)
  end
end
