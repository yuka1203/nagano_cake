class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
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
    # 商品があるかどうかif文で分岐させる
    if CartItem.find_by()
      # ある場合は個数をフォームから送られた個数分追加する
    else
    # 　カートモデルにレコードを新規作成する
    end
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :status)
  end
end
