class ImagesController < ApplicationController

  def win
    @image = Image.find(params[:id])
    @image.wins += 1
    @image.save
    render json: @image.tournament
  end

end
