class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer
    @cart_item = CartItem.new
  end
  
  
  def create
    if @cart_item.blank? 
      @cart_item = CartItem.new(cart_item_params) 
    end
    @cart_item.quantity += params[:quantity].to_i 
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
