class Api::V1::ApiController < ActionController::Base
  # before_action :configure_devise_permitted_parameters, if: :devise_controller?
  # before_filter :authenticate_user!
  
  private
    
    # The request was a valid request, but the server is refusing to respond to it. 
    # Unlike a 401 Unauthorized response, authenticating will make no difference.
    def user_not_authorized
      head :forbidden
    end

end