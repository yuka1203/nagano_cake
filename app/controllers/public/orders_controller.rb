class Public::OrdersController < ApplicationController
  def new
    @order = current_customer.orders.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @orders = Order.all
    @cart_items = current_customer.cart_items.all
    @total_payment = 0
    @shipping_cost = 800
    if params[:order][:address_select] == "0"
     @order.shipping_postal_code = current_customer.postal_code
     @order.shipping_address = current_customer.address
     @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_select] == "1"
      address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = address.postal_code
      @order.shipping_address = address.address
      @order.shipping_name = address.name
    else
      @order.shipping_postal_code = @order.shipping_postal_code
      @order.shipping_address = @order.shipping_address
      @order.shipping_name = @order.shipping_name
    end
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_details = OrderDetail.new
    @order_details.item_id = cart_item.item_id
    @order_details.amount = cart_item.amount
    @order_details.order_id = @order.id
    @order_details.total_price = cart_item.subtotal
    @order_details.save
    end
    redirect_to orders_complete_path
    current_customer.cart_items.destroy_all
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = CartItem.all
  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :status)
  end
end
