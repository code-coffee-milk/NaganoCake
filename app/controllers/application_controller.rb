class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 def after_sign_in_path_for
 products_path
 end

 def after_log_in_path_for
 products_path
 end

protected
  
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [
    :email,
    :last_name,
    :first_name,
    :last_name_kana,
    :first_name_kana,
    :postal_code,
    :prefecture_name,
    :phone_number,
    :address,
  ])
end

end