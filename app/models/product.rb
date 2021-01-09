class Product < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :orders, through: :order_products
	has_many :order_products

attachment :image

validates :is_active, inclusion: { in: [true, false] }

end
