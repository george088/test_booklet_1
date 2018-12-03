class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user,  only: [:index, :update, :current]
  before_action :authorize_as_admin, only: [:destroy]
  before_action :authorize,          only: [:update]

  def index
    render json: {status: 200, msg: 'Авторизован'}
  end

  def current
    current_user.update!(last_login: Time.now)
    render json: current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 200, msg: 'Пользователь создан'}
    else
      render json: {status: 422, msg: 'Пользователь не создан'}
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { status: 200, msg: 'Данные пользователя обновленны' }
    else
      render json: {status: 422, msg: 'Данные пользователя не обновленны'}
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { status: 200, msg: "Пользователь с id #{params[:id]} удалён" }
    else
      render json: {status: 422, msg: "Пользователь с id #{params[:id]} не удалён"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def is_admin?
    role == 'admin'
  end
  
  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end
end
