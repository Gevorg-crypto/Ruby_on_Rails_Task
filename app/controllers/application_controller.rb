class ApplicationController < ActionController::Base
  attr_reader :current_user

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  protected
  def authenticate_admin
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

end
