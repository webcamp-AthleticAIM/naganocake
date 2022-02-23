class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @total_amount = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def
    order_paramas
    params.require(:order).permit(:name, :postal_code, :address, :payment, :postage, :total_payment, :order_status)
  end
end
