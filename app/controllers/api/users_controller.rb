class Api::UsersController < ApplicationController

  before_action :authorize, except: [:create, :token]

  def index
    @users = User.all
  end

  # POST /api/users
  def create
    user = User.create(user_params)

    if user.save
      token
    else
      render status: :unprocessable_entity
    end
  end

  # GET /api/users/:id
  def show
    render status: :not_found unless @user = User.find(params[:id])
  end

  # PATCH/PUT /api/users/:id
  def update
    user = User.find(params[:id])

    if user && user.update(user_params)
      render json: user
    else
      render status: :unprocessable_entity
    end
  end

  # DELETE /api/users/:id
  def destroy
    user = User.find(params[:id])

    if user && user.destroy
      render json: user
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
      params.require(:user).permit(:name, :email, :password,
        :profile_img, :skill, :location, :latitude, :longitude,)
    end

end
