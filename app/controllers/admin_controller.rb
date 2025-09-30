class Api::Admin::AdminController < ApiController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
      token = request.headers['Authorization']
      Auth::ValidateAdmin.call!(token:token)
  end
end
