class ImagesController < ApplicationController
  def index
    @images = Tournament.find(params[:tournament_id]).images
    render json: @images, status: 200
  end

  def create
    @image = Image.new(new_image_params)
    if @image.save
      render json: @image, status: 201
    else
      render json: @image.errors,
      status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
    render json: @image, status: 201
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(edit_image_params)
      render json: @image, status: :ok
    else
      render json: @image.errors,
      status: :unprocessable_entity
    end
  end

  private

  def new_image_params
    params.require(:image).permit(:url, :tournament_id, :user_id)
  end

  def edit_image_params
    params.require(:image).permit(:wins, :flags)
  end
end
