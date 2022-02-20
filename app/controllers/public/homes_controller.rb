class Public::HomesController < ApplicationController
  def top
    #@items = Items.limit(6).order('created_at DESC')
  end

  def index
   #@items = Item.limit(6).order('created_at DESC')
  end

  def about
  end
end
