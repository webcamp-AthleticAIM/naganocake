class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @current_addresses = Customer.select(:postal_code, :address, :last_name, :first_name)
    @address = Address.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    #合計金額
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    #送料込み請求金額
    @total_payment = @total_price + @order.postage
    #配送先の選択肢によって動作を分岐
    if params[:order][:order_addresses] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:order_addresses] == '1'
      if Address.exists?(id: params[:order][:address_id])
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      else
        flash.now[:notice] = '配送先が登録されていません'
        render 'new'
      end
    elsif params[:order][:order_addresses] == '2' && @order.postal_code? && @order.address? && @order.name?
    else
      flash.now[:notice] = '未選択の選択肢があります'
      render 'new'
    end
  end

  def create
    @cart_items = current_customer.cart_items.all

    p @order = current_customer.orders.new(order_params)
    if @order.save
      #注文詳細に保存
      @cart_items.each do |cart|
      order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.item_quantity = cart.item_amount
        order_detail.price = cart.item.add_tax_price
        order_detail.save
      end
      #カート内商品を空にする
      current_customer.cart_items.destroy_all
      redirect_to thanks_path
    else
      @order = Order.new(order_params)
      render 'new'
    end

  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :postage, :total_payment, :order_status)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
