class Order < ApplicationRecord
    
    has_many :addresses
    belongs_to :cart_item
    
end
