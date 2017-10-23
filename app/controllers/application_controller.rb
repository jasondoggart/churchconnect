class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
   
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def hello
    render html: "hello world"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :cellphone, :street_address, :city, :province, :postal_code])
  end

end
