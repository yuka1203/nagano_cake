class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  def create
  end
end
