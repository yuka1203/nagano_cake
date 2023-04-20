class Address < ApplicationRecord
    
    # has_many :orders
    belongs_to :customer
    
    def address_display
        '〒' + postal_code+  ' ' + address + ' ' + name
    end
    
end
