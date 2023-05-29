class SaxophonesController < ApplicationController
  before_action :set_saxophone

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_saxophone
    @saxophone = Saxophone.find(params[:id])
  end
end
