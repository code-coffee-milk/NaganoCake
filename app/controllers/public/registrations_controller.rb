class RegistrationsController < ApplicationController
  
  
  protected
  def sign_up_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    public_customers_path(resource)
  end
end
