class Customers::CustomersController < ApplicationController
   before_action :authenticate_customer!, only: [:show, :edit,:update]
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:is_deleted,:email)
  end
end
