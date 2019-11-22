class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname] ,keys: [:first_name] ,keys: [:last_name] ,keys: [:first_name_kana] ,keys: [:last_namekana] ,keys: [:birthday],keys: [:phone_number])
  end
end
