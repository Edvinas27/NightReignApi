class QualitiesController < ApplicationController
  def index
    result = GetQualities.call
    if result.success?
      render json: result.qualities, status: :ok
    end
  end
end

# this will be deleted
