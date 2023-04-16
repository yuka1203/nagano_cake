class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @ordrs = current_customer.cart_items.all
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :status)
  end
end
