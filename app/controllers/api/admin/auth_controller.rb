class Api::Admin::AuthController < AdminController
  def create
    result = Auth::CreateClientToken.call!(params: auth_params)
    render json: { token: result.token }, status: :ok
  end

  private

  def auth_params
    params.permit(:client_id)
  end
end
