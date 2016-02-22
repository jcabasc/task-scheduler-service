module Api
  module V1
    class ServerSerializer < ActiveModel::Serializer
      include ActiveModel::Serialization
      attributes :id, :name
    end
  end
end