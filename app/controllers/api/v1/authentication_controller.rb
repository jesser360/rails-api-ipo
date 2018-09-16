class Api::V1::AuthenticationController < ApplicationController
 skip_before_action :authenticate_request


 def register
   @user = User.create(user_params)
  if @user.save
   response = { message: 'User created successfully'}
   render json: response, status: :created
  else
   render json: @user.errors, status: :bad
  end
 end


 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])

   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end

private
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:email, :password)
  end
