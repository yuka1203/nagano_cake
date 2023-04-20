class Order < ApplicationRecord
    
    # has_many :addresses
    has_many :cart_item
    belongs_to :customer
    
    enum payment: {credit_card: 0, transfer: 1}
    
end
