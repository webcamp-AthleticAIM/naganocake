class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
   @cart_item = CartItem.new
   @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:introduction,:image_id,:sales_status)
  end

end
