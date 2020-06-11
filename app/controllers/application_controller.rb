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

  def session_availability(session)
    # TODO: change 20 to a class constant
    # current difficulty: constant isn't regonized
    # to reproduce, set a Session class constant, call here, see rails server
    { "availability": (20 - session.students.count) }
  end

  def session_info(session)
    session.attributes.merge(session_availability(session))
  end

end
