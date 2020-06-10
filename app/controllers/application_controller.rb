class ApplicationController < ActionController::API

  before_action :sanitize_devise_params, if: :devise_controller?
  include ActionController::MimeResponds
  respond_to :json

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

end
