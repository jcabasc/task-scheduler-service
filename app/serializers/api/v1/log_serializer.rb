module Api
  module V1
    class LogSerializer < ActiveModel::Serializer
      include ActiveModel::Serialization
      attributes :status, :name
    end
  end
end