class Api::UsersController < ApplicationController

  before_action :authorize, except: [:create, :token]

end
