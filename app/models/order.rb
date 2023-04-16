class Order < ApplicationRecord
    
    has_many :addresses
    belongs_to :cart_item
    
    enum payment: {credit_card: 0, transfer: 1}
    
end
