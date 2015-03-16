class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    whitelist = ->(u) { u.permit(:username, :email, :password, :password_confirmation,
                                 :current_password, :provider, :uid, :affiliation) }
    devise_parameter_sanitizer.for(:sign_up, &whitelist)
    devise_parameter_sanitizer.for(:account_update, &whitelist)
    # devise_parameter_sanitizer.for(:sign_in, &whitelist)
  end

end
