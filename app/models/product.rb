class Product < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :orders, through: :order_details
	has_many :order_details

attachment :image

validates :is_active, inclusion: { in: [true, false] }

end
