class Public::AddressesController < ApplicationController
  def index
    @address = current_customer.addresses.new
    @addresses = current_customer.addresses.all
  end

  def edit
  end

  def create
    @address = current_customer.addresses.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def update
    address = current_customer.addresses
    address.update(address_params)
    redirect_to customers_mypage_path
  end

  def destroy
  end
  
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
  
end
