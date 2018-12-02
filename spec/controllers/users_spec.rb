require "rails_helper"

class UsersControllerTest < ActionController::TestCase
  should "(for POST #create) restrict parameters on :user to first_name, last_name, email, and password" do
    params = {
      user: {
        email: 'johndoe@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }
    matcher = permit(:email, :password, :password_confirmation).
      for(:create, params: params).
      on(:user)
    assert_accepts matcher, subject
  end
end