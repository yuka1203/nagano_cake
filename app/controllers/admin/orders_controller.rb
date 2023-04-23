class Admin::OrdersController < ApplicationController
  def show
    @order_details = OrderDetail.all
  end
end
