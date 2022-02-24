class Admin::ItemsController < ApplicationController

    before_action :authenticate_admin!





  def new
    @item = Item.new
  end

  def create
    p @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id), notice: "商品を追加しました。"
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id), notice: "商品の内容を変更しました。"
    else
      render :new
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :sales_status, :genre_id)
  end

end
