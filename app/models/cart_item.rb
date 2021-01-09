class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

validates :quantity, presence: true
validates :customer_id, :product_id, :quantity, presence: true
 
end
