class UsersController < ApplicationController

  def sign_in
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      render json: {token: user.token}
    else
      head :unauthorized
    end
  end

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

  def index
    auth_header = request.headers['AUTHORIZATION'].to_s
    @user = User.where(token: auth_header).take
    render json: @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :token)
    end

end
