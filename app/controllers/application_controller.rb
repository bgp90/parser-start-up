class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    current_user
  end

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :address, :phone_number, :car_model, :car_plate, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :address, :phone_number, :car_model, :car_plate])
  end
end
