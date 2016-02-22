module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      include ActiveModel::Serialization
      attributes :id, :name, :executable_path, :status, :days_of_week, :started_at_int, :ended_at_int, :server_ids
      has_many :servers, serializer: ServerSerializer

      def started_at_int
        object.started_at ? object.started_at.to_i : nil
      end

      def ended_at_int
        object.started_at ? object.started_at.to_i : nil
      end
    end
  end
end