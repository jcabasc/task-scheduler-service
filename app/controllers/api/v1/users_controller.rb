module Api
  module V1
    class UsersController < BaseController
      skip_before_filter :authorized?, only: [:show]

      def show
        user = User.find(params[:id])
        respond_with user
      end
    end
  end
end