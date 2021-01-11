class Order < ApplicationRecord

	belongs_to :customer
	has_many :order_products, dependent: :destroy

  def full_address
    return "〒" + self.shipping_postal_code + " " + self.shipping_street_adress
  end
end
