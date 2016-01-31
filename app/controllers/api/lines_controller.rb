class Api::LinesController < ApplicationController

  before_action :authorize

  # POST /api/users/:id/lines
  def create
    user = User.find(params[:user_id])

    line = Line.create(
      brand: params[:line]["brand"],
      length: params[:line]["length"],
      width: params[:line]["width"],
      style: params[:line]["style"],
      system: params[:line]["system"],
      user_id: user.id
      )

    if line.valid? && line.save
      render json: line
    elsif !line.valid?
      render json: line.errors.messages
    else
      render status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/lines/:id
  def update
    line = Line.find(params[:id])

    if line && line.update(line_params)
      render json: line
    else
      render status: :unprocessable_entity
    end
  end

  # DELETE /api/lines/:id
  def destroy
    line = Line.find(params[:id])

    if line && line.destroy
      render json: line
    else
      render status: :unprocessable_entity
    end
  end

  private
    def line_params
      params.require(:line).permit(:brand, :length, :width, :style, :system, :user_id)
    end
end
