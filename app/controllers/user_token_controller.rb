class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token

  def index
    render json: { message: "Welcome to a simple API server with 
     Auth0"}
  end

  def create
    user = User.new(user_token_params_permited)
    if user.save
      render json: {status: 200, msg: 'User was created.'}
    end
  end

private

  def user_token_params_permited
    params.require(:user).permit(:password, :email)
  end
end
