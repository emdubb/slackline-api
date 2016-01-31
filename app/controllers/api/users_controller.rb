class Api::UsersController < ApplicationController

  before_action :authorize, except: [:create, :token]

  # POST /api/users
  def create
    user = User.create(user_params)

    if user.save
      token
    else
      render status: :unprocessable_entity
    end
  end

  # POST /api/token
  def token
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      payload = {
        email: user.email
      }
      render json: {token: AuthToken.encode(payload)}
    else
      render status: :unauthorized
    end
  end

  # GET /api/me
  def me
    @user = User.find_by(email: @credentials[:email])
    render status: :not_found unless @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
