module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      include ActiveModel::Serialization
      attributes :id, :name, :executable_path, :status, :days_of_week
      has_many :servers, serializer: ServerSerializer
    end
  end
end