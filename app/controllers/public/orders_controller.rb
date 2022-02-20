class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @current_addresses = Customer.select(:postal_code, :address, :telephone_number)
    @order = Order.new
  end

  def confirm
    
  end
  
  def create

  end
  
  def thanks
  end

  def index

  end

  def show
  end

  private

  def ordrer_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :postage, :total_payment, :order_status)
  end
end
