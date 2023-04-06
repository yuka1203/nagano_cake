class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).parmit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
