class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  private
  def rescue_not_found(err)
    render json: { error: err.message }, status: :not_found
  end
  
  def rescue_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
