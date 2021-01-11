class Customers::OrdersController < ApplicationController

    include ApplicationHelper

  def new
    @order = Order.all
    @shippings = Shipping.where(customer: current_customer)
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.shipping_fee = 800
    @order.save

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_products = @order.order_products.new
      @order_products.product_id = cart_item.product.id
      @order_products.purchase_price = cart_item.product.price
      @order_products.quantity = cart_item.quantity
      @order_products.save
    end
    current_customer.cart_items.destroy_all
    redirect_to customers_order_complete_path
  end

  def comfirm
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    address = params[:address]
    case address
      when 'address' then
        @order.shipping_postal_code = current_customer.postal_code
        @order.shipping_street_adress = current_customer.address
        @order.shipping_name = current_customer.full_name
      when 'shipping_address' then
        shipping = params[:shipping]
        shipping = Shipping.find_by(id: shipping[:shipping_id])
        @order.shipping_postal_code = shipping.postal_code
        @order.shipping_street_adress = shipping.address
        @order.shipping_name = shipping.name
    end
    total_price = 0
    for cart_item in @cart_items do
      product = cart_item.product
      total_price += product.price * cart_item.quantity
    end
    @total_price = total_price
    render "customers/orders/comfirm"
  end

	def complete
	end

	def index
	  @orders = current_customer.orders
	end

	def show
	end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_street_adress, :shipping_name, :method_of_payment)
  end

end