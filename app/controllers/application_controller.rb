class ApplicationController < ActionController::API
  include Pagy::Backend
  before_action :set_default_format

  rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
  rescue_from ActiveRecord::RecordNotDestroyed, with: :handle_record_not_destroyed

  private
  def set_default_format
    request.format = :json
  end

  def handle_parameter_missing(exception)
    render json: { error: [exception.message] }, status: :unprocessable_entity
  end
  def handle_record_not_found(exception)
    render json: { error: [exception.message] }, status: :not_found
  end
  def handle_record_invalid(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
  def handle_record_not_destroyed(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
