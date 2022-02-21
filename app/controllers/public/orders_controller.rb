class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @current_addresses = Customer.select(:postal_code, :address, :last_name, :first_name)
    @order.name = current_customer.first_name + current_customer.last_name
    
  end

  def confirm
    p @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = CartItem.all
  end

  def create

    p @order = Order.find(order_params)


    if @order.sa

    else
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
end
