module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      include ActiveModel::Serialization
      attributes :id, :email, :authentication_token
    end
  end
end