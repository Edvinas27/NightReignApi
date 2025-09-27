# Handles API-specific functionality, like validation failures or interactor errros.
class ApiController < ApplicationController
  include Pagy::Backend

  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  private
  def handle_record_invalid(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
