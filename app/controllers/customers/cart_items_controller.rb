class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.all
  end
  
  def create
    @cart_item = current_customer.cart_items.find_by(product_id: params[:product_id])
    if @cart_item.nil?
    @cart_item = current_customer.cart_items.new(cart_item_params)
    else 
    @cart_item.quantity += params[:quantity].to_i 
    end
    @cart_item.save
    redirect_to customers_cart_items_path
  end
  
  
  def update
    @cart_item = CartItem.find(params[:id])
    if@cart_item.update(cart_item_params)
      redirect_to customers_cart_items_path
    else
      @cart_items = current_customer.cart_items
      render :index
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path 
  end
 
  def all_destroy
    @customer = current_customer
    @cart_items = @customer.cart_items
    @cart_items.destroy_all
    redirect_to customers_cart_items_path
  end
    
  
  
  private
  def cart_item_params
  params.require(:cart_item).permit(:quantity, :product_id, :customer_id)
  end
end
