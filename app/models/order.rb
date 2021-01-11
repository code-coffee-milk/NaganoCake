class Order < ApplicationRecord
    
	belongs_to :customer
	has_many :order_products, dependent: :destroy
    belongs_to :shipping
    
end
