class ApplicationController < ActionController::Base
  include Knock::Authenticable

  protected
  
  # Method for checking if current_user is admin or not.
  def authorize_as_admin
    return_unauthorized unless !current_user.nil? && current_user.is_admin?
  end
  private
  # Define unauthorized access json response
      def unauthorized_entity(entity_name)
          render json: { error: "Unauthorized request" }, status:     
          :unauthorized
      end
end
