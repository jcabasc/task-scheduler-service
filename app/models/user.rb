class User < ActiveRecord::Base
  devise :database_authenticatable
  include Authentication
  before_save :ensure_authentication_token
end
