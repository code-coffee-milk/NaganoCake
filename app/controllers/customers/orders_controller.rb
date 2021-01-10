class Customers::OrdersController < ApplicationController

    include ApplicationHelper

  def new
    @order = Order.new
  end

  def create
  @order = current_customer.orders.new(order_params)
  @order.save
  
  @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_products = @order.order_products.new
        @order_products.product_id = cart_item.product.id
        @order_products.purchase_price = cart_item.product.price
        @order_products.quantity = cart_item.quantity
        @order_products.save
        current_customer.cart_items.destroy_all
      end
  redirect_to customers_orders_comfirm_path
  end

  def comfirm
	  @order = Order.find(params[:id])
    @order_products = @order.order_products
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
    params.require(:order).permit(:shipping_postal_code, :shipping_street_adress, :shipping_name, :payment_of_method, :total_payment, :customer_id, :shipping_fee)
  end
 
end