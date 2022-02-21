class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order = Order.new
    p @order.customer_id = current_customer.id
    p @order_addresses = Customer.select(:postal_code, :address, :last_name, :first_name)
    #@neworder = Order.new
    puts 'test'
  end

  def create
    @order = Order.new(order_params)
    Address.customer_id =  current_customer.id
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    puts 'test'

    if @order.save
      redirect_to 'confirm'
    else
      render 'new'
    end
  end

  def confirm
    puts 'test'
    @order = Order.new(order_params)
    
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
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
