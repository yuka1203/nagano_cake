class CartItem < ApplicationRecord
    
    has_many :order
    belongs_to :item
    belongs_to :customer
    
    def subtotal
        item.with_tax_price*amount
    end
    
end
