class Public::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to :index
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
