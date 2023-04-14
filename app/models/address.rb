class Address < ApplicationRecord
    
    belongs_to :order
    has_many :customers
    
end
