class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :customer_id, :product_id, :quantity, presence: true

end
