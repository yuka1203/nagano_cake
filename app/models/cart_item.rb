class CartItem < ApplicationRecord
    
    has_many :order
    has_many :item
    belongs_to :customers
    
    def subtotal
        item.with_tax_price*amount
    end
    
end
