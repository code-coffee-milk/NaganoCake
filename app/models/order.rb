class Order < ApplicationRecord

	belongs_to :customer
	has_many :order_products, dependent: :destroy

  def full_address
    return "〒" + self.shipping_postal_code + " " + self.shipping_street_adress
  end

  def total_payment
    total_price = 0
    self.order_products.each do |product|
      total_price += product.purchase_price * product.quantity
    end
    return self.shipping_fee + total_price
  end
end
