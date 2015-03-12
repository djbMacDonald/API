class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { token: @user.token }
    else render json: { message: 'Failed', status: 500 }
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :token)
    end

end
