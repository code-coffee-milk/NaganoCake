class SessionsController < ApplicationController
  before_action :reject_customer, only: [:create]
  layout 'public'
  
  def after_sign_in_path_for(resource)
    public_customers_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)
        flash[:notice] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:notice] = "必須項目を入力してください。"
    end
  end
  
end
