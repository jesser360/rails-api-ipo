class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods

   # Add a before_action to authenticate all requests.
   # Move this to subclassed controllers if you only
   # want to authenticate certain methods.

   # THIS IS WHERE WE AUTH REQUEST WITH JWT
   before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
      # @current_user = AuthorizeApiRequest.call(request.headers).result
      # render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end


   # FROM https://sourcey.com/building-the-prefect-rails-5-api-only-app/
   # include ActionController::HttpAuthentication::Token::ControllerMethods

   # before_action :authenticate

   # # Authenticate the user with token based authentication
   # def authenticate
   #   authenticate_token || render_unauthorized
   # end
   #
   # def authenticate_token
   #   authenticate_with_http_token do |token, options|
   #     @current_user = User.find_by(api_key: token)
   #   end
   # end
   #
   # def render_unauthorized(realm = "Application")
   #   self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
   #   render json: 'Bad credentials', status: :unauthorized
   # end
 end
