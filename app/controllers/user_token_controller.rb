class UserTokenController < Knock::AuthTokenController
#   skip_before_action :verify_authenticity_token
#   # before_action :users, only: [:show, :update, :destroy]

#   def index
#     render json: "sdfsdfsd"
#   end

#   def create
#     puts "1"
#     user = User.new(user_token_params_permited)
#     puts "2"
#     if user.save
#       puts "3"
#       render json: {status: 200, msg: 'User was created.'}
#     end
#     puts "4"
#   end

# private

#   def user_token_params_permited
#     params.require(:user).permit(:email, :password)
#   end
end
