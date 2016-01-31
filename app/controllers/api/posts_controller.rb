class Api::PostsController < ApplicationController

  before_action :authorize

  # GET /api/posts
  def index
    posts = Post.all
    render json: posts
  end

  def create
    if params[:line_id]
      line = Line.find(params[:line_id])
      if line.posts.any? { |posts| !posts.finished_at }
        render json: { message: "That line is already posted!"}
      else
        post = Post.create(
          location: params[:post]["location"],
          difficulty: params[:post]["difficulty"],
          message: params[:post]["message"],
          started_at: Time.now,
          line_id: params[:line_id]
          )
        if post.valid? && post.save
          render json: post
        elsif !post.valid?
          render json: line.errors.messages
        else
          render status: :unprocessable_entity
        end
      end
    else
      render json: {message: "Missing id for line to post"}
    end
  end

  private
    def post_params
      params.require(:post).permit(:latitude, :longitude, :location, :difficulty,
        :message, :started_at, :finished_at, :line_id)
    end

end
