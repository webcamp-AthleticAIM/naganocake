class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create

  end

  def show
  end

  def thanks
  end

  private

  def ordrer_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :postage, :total_payment, :order_status)
  end
end
