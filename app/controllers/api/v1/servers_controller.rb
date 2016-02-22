module Api
  module V1
    class ServersController < BaseController
      skip_before_filter :authorized?

      def show
        server = Server.find(params[:id])
        respond_with server
      end

      def index
        servers = Server.all
        respond_with servers
      end
    end
  end
end