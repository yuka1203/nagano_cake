class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.all
    # @address = Address.find(params[:order][:address_id])
    # @order.shipping_postal_code = @address.postal_code
    # @order.shipping_address = @address.address
    # @order.shipping_name = @address.name
    @cart_items = current_customer.cart_items.all
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
    params.require(:order).permit(:payment_method, :address_select, :customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :status)
  end
end
