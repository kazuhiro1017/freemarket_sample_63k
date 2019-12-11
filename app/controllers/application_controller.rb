class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:encrypted_password] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana]  )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number] )
  end
end


