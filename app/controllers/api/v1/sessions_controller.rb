module Api
  module V1
    class SessionsController < BaseController
      skip_before_filter :authorized?, only: [:create]

      def create
        email = params[:email]
        password = params[:password]
        login = UserAuthenticator.new(email, password)
        login.authenticate
        if login.authenticated?
          user = login.user
          user.save
          render json: { success: true, resource: UserSerializer.new(user) }, status: 200
        else
          render json: { success: false, error: login.error }, status: 401
        end
      end

      def destroy
        @current_user.reset_authentication_token
        render json: { success: true, message: "Token for user #{@current_user.email} was reset successfully." }
      end

    end
  end
end
