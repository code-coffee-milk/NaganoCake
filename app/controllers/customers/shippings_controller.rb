class Customers::ShippingsController < ApplicationController
    
  def index
  	@shipping_addresses = current_customer.shipping_address
  	@shipping_address = ShippingAddress.new
  end

	def create
	  @shipping = Shipping.new(shipping_params)
	  @shipping.customer_id = current_customer.id
      @shippings = current_customer.shipping
	  if @shipping.save
	  	 flash.now[:notice] = "新規配送先を登録しました"
	     # redirect_to customers_shippings_path
	  # else
	  # 	 @shippings = current_customer.shipping
	  #    render 'index'
      end
	end

	def edit
    @shippings = Shipping.find(params[:id])
	end

	def update
	  @shipping = Shipping.find(params[:id])
	  if @shipping.update(shipping_params)
  	 flash[:success] = "配送先を変更しました"
     redirect_to customers_shippings_path
	  else
	   render "edit"
	  end
	end

	def destroy
	  @shipping = Shipping.find(params[:id])
	  @shipping.destroy
    @shippings = current_customer.shipping
    flash.now[:alert] = "配送先を削除しました"
	  # redirect_to customers_shipping_addresses_path
	end

	private

	def shipping_address_params
  	params.require(:shipping).permit(:postal_code, :address, :name)
  end

end

