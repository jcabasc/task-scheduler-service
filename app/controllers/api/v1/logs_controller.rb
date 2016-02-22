module Api
  module V1
    class LogsController < BaseController
      skip_before_filter :authorized?

      def index
        logs = Log.get_all
        respond_with logs
      end
    end
  end
end