class ApplicationController < ActionController::API

  before_action :sanitize_devise_params, if: :devise_controller?
  include ActionController::MimeResponds
  respond_to :json

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def readable_validation_errors(object)
    object.errors.map { |k, v| "#{k} #{v}" }
  end

  def readable_errors(object)
    {
      error: 'Invalid info params',
      messages: readable_validation_errors(object)
    }
  end

end
