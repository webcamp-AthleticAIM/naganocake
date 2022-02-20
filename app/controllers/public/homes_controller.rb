class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(6).order('created_at DESC')
  end

  def about
  end
end
