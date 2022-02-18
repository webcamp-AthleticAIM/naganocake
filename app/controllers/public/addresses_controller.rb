class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.save
      redirect_to address_path
  end

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_path
    else
      render edit_address_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
  end

  private

  def address_params
    params.riquer(:address).permit(:customer_id, :postal_code, :address, :name)
  end
end
