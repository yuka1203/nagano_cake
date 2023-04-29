class Order < ApplicationRecord
    
    # has_many :addresses
    # has_many :cart_item
    has_many :order_details
    belongs_to :customer
    
    enum payment: {credit_card: 0, transfer: 1}
    enum status: {waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, shipped: 4}
    
end
