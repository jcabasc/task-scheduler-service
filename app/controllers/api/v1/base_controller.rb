module Api
  module V1
    class BaseController < ActionController::Base
      before_filter :authorized?
      respond_to :json
      include Api::V1::HttpBasicAuthSupport

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error_message: 'Record not found' }, status: 404
      end

      def authorized?
         authorized = authenticate_with_token || authenticate_with_basic_auth
         head :unauthorized unless authorized
      end

      private

      def authenticate_with_token
        user = if params[:auth_token].present?
          load_user_from_token(params[:auth_token])
        else
          authenticate_with_http_token { |token| load_user_from_token(token) }
        end
        @current_user ||= user
        user.present?
      end

      def load_user_from_token(token)
        User.find_by(authentication_token: token)
      end

    end
  end
end