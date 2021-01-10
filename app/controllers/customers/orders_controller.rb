class Customers::OrdersController < ApplicationController

    include ApplicationHelper

  def new
   @order = Order.new
	end

	def comfirm
    @cart_items = current_customer.cart_items.all
		@order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:method_of_payment]
    )

    # total_priceに請求額を代入
    @order.total_price = billing(@order)

    # addressにresidenceの値がはいっていれば
    if params[:order][:addresses] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.residence
      @order.name        = current_customer.last_name +
                           current_customer.first_name

    # addressにshipping_addressesの値がはいっていれば
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = Shipping.find(params[:order][:shipping_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name

    # addressにnew_addressの値がはいっていれば
    elsif params[:order][:addresses] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @ship = "1"

      # バリデーションがあるならエラーメッセージを表示
      unless @order.valid? == true
        @shipping = Shipping.where(customer: current_customer)
        render :new
      end
    end
	end

	def create
    @order = Order.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to customers_orders_comfirm_path
  end
  #注文確定したら、カート内を削除＋管理者の注文商品に一覧
  def aa 
    # もし情報入力でnew_addressの場合ShippingAddressに保存
    if params[:order][:ship] == "1"
      current_customer.shipping.create(address_params)
    end

    # カート商品の情報を注文商品に移動
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
    OrderProduct.create(
      product:  cart_item.product,
      order:    @order,
      quantity: cart_item.quantity,
      price: price(cart_item.product)
    )
    end
    # 注文完了後、カート商品を空にする
    @cart_items.destroy_all
	end

	def complete
	end

	def index
	  @orders = current_customer.orders
	end

	def show
	  @order = Order.find(params[:id])
    @order_products = @order.order_products
	end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_street_adress, :shipping_name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def to_comfirm
    redirect_to customers_cart_items_path if params[:id] == "comfirm"
  end
  
end

