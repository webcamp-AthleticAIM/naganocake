class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:id])
  end
end
