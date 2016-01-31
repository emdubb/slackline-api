require 'auth_token'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authorize
    auth_header = request.headers["Authorization"]

    if auth_header
      auth_token = auth_header.split(' ').last
      @credentials = AuthToken.decode(auth_token)
    else
      render status: :unauthorized
    end
  end

end
