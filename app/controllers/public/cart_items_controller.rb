class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create

  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :item_amount)
  end
end
