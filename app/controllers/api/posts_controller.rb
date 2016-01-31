class Api::PostsController < ApplicationController

  before_action :authorize

  def index
    posts = Post.all
    render json: posts
  end

  private
    def post_params
      params.require(:post).permit(:latitude, :longitude, :location, :difficulty,
        :message, :started_at, :finished_at, :line_id)
    end

end
