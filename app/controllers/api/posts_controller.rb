class Api::PostsController < ApplicationController

  before_action :authorize

  # GET /api/posts
  def index
    if params[:current]
      posts = Post.where(finished_at: nil)
    else
      posts = Post.all
    end
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

  def show
    render status: :not_found unless @post = Post.find(params[:id])
    @line = Line.find(@post.line_id)
    @user = User.find(@line.user_id)
  end

  def update
    post = Post.find(params[:id])

    if params[:finished]
      post.finished_at = Time.now
      post.save
      render json: post unless !post.save
    elsif post && post.update(post_params)
      render json: post
    else
      render status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:latitude, :longitude, :location, :difficulty,
        :message, :started_at, :finished_at, :line_id)
    end

end
