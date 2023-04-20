class Public::OrdersController < ApplicationController
  def new
    @order = current_customer.order.new
  end

  def confirm
    @order = Order.new(order_params)
    @orders = Order.all
    @cart_items = current_customer.cart_items.all
    @total = 0
    @shipping_cost = 800
    if params[:order][:address_select] == "0"
     @order.shipping_postal_code = current_customer.postal_code
     @order.shipping_address = current_customer.address
     @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_select] == "1"
      @address = Address.find(params[:order][:address_id])
    else
      @order.shipping_postal_code = @order.shipping_postal_code
      @order.shipping_address = @order.shipping_address
      @order.shipping_name = @order.shipping_name
    end
  end

  def complete
    current_customer.cart_items.destroy_all
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @order = current_customer.order.all
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :status)
  end
end
