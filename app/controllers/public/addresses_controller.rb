class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id

    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address. update(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render edit_address_path
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
