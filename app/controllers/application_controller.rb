class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :give_name, :family_name_kana, :give_name_kana, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'furima' && password == 'zaq123'
    end
  end
end
