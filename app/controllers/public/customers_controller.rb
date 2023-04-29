class Public::CustomersController < ApplicationController
  
  # before_action :is_matching_login_customer, only: [:show, :edit, :update]
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def confirm
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
   end
   
  # def is_matching_login_customer
  #   customer = Customer.find(params[:id])
  #   unless customer.id == current_customer.id
  #     redirect_to new_customer_session_path
  #   end
  # end
end
