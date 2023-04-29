class OrderDetail < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    enum making_status: {zero: 0, one: 1, two: 2, three: 3}
    
end
