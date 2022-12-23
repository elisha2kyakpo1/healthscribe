class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:full_name, :email, :password, :password_confirmation, :pic)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :email, :password, :current_password, :pic)
    end
  end
end
