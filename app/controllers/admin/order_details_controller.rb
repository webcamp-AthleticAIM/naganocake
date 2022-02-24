class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.production_status = OrderDetail.production_status_methods[params[:order_detail][:production_status_method]]
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:item_quantity, :price, :production_status)
    end

end
