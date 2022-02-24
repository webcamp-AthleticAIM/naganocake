class Admin::HomesController < ApplicationController
  def top
    @orders = Order.where(customer_id: current_customer.id)
  end
end
