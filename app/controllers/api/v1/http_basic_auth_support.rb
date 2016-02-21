module Api
  module V1
    module HttpBasicAuthSupport

      def authenticate_with_basic_auth
        authenticated = member_from_basic_auth {|a| sign_in(a.resource) }
        request_http_basic_authentication unless authenticated
        authenticated.present?
      end

      def member_from_basic_auth(&block)
        authenticate_with_http_basic do |email, password|
          a = UserAuthenticator.new(email, password)
          a.authenticate
          yield a if block_given?
          a.authenticated? ? a.resource : nil
        end
      end

    end
  end
end