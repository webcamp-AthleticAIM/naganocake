class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.order_status = Order.order_status_methods[params[:order][:order_status_method]]
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :postage, :total_payment, :order_status)
  end
end
