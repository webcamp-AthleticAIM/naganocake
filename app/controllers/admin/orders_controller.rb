class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :postage, :total_payment, :order_status)
  end
end
