class Address < ApplicationRecord
    
    has_many :order
    belongs_to :customers
    
    def address_display
        '〒' + postal_code+  ' ' + address + ' ' + name
    end
    
end
