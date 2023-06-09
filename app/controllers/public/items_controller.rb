class Public::ItemsController < ApplicationController
  def index
    @count = Item.count
    @items = Item.page(params[:page]).limit(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  def item_params
    params.require(:items).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
  
end
