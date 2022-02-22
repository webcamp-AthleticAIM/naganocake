class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @current_addresses = Customer.select(:postal_code, :address, :last_name, :first_name)
    @address = Address.new

  end

  def confirm
    p @order = Order.new(order_params)
    p params[:order][:address_id]
    #@cart_items = CartItem.find(params[:id])
    #配送先の選択肢によって動作を分岐
    if params[:order][:order_addresses] == '0'
      p @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:order_addresses] == '1'
      if p Address.exists?(id: params[:order][:address_id])
        p @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      else
        render 'new'
      end
    elsif params[:order][:order_addresses] == '2' && @order.postal_code? && @order.address? && @order.name?

    else
      render 'new'
    end
  end

  def create
    #@order = Order.find(order_params)
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save

      #注文詳細に保存
      order_detail = OrderItem.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.item_quantity = cart_item.item_amount
      order_detail.price = cart_item.item.price
      order_detail.save
      #カート内商品を空にする
      current_customer.cart_items.destroy_all
      redirect_to 'thanks'
    else
      @order = Order.new(order_params)
      render 'new'
    end

  end

  def thanks
  end

  def index

  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment, :postage, :total_payment, :order_status)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
