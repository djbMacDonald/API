class TournamentsController < ApplicationController
  def index

    if params[:user_id]
      @tournaments = User.find(params[:user_id]).tournaments
    else
      @tournaments = Tournament.all
    end
      render json: @tournaments
  end

  def show
    @tournament = Tournament.find(params[:id])

    render json: @tournament
  end

  def create
    @tournament = Tournament.new(new_tournament_params)

    if @tournament.save
      render json: @tournament, status: :created, location: @tournament
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(edit_tournament_params)
      render json: @tournament, status: :ok
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy

    head :no_content
  end

  private

  def new_tournament_params
      params.require(:tournament).permit(:question, :user_id)
  end

  def edit_tournament_params
      params.require(:tournament).permit(:email_list)
  end
end
