# Handles general concerns, auth, formating, route errors
class ApplicationController < ActionController::API
  before_action :set_default_format

  rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def handle_route_not_found
    render json: { error: ["Route not found #{request.path}"] }, status: :not_found
  end

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
end
