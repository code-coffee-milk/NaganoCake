class Customers::ShippingsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end

  def create
    @shipping = current_customer.shippings.new(shipping_params)
    if @shipping.save(shipping_params)
      redirect_to customers_shippings_path
    else
      @shippings = Shipping.all
      render :index
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to customers_shippings_path
    else
      render :edit
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to customers_shippings_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end
end
