class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @current_addresses = Customer.select(:postal_code, :address, :last_name, :first_name)
    @order.name = current_customer.last_name + current_customer.first_name

  end

  def confirm
    @order = Order.new(order_params)
    #@cart_items = CartItem.find(params[:id])
    if params[:order_addresses] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order_addresses] == '1'
      @order = Order.new(order_params)
      @address = Address.find(params[:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order_addresses] == '2' && @order.postal_code? && @order.address? && @order.name?

    else
      render 'new'
    end
  end

  def create
    @order = Order.find(order_params)

    if @order.save
      current_customer.cart_items.destroy_all
      redirect_to 'thanks'
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
