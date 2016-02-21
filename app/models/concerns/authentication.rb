module Authentication
  extend self

  def ensure_authentication_token
    self.authentication_token = generate_authentication_token if authentication_token.blank?
  end

  def reset_authentication_token
    self.authentication_token = nil
    self.save
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless self.class.exists?(authentication_token: token)
    end
  end
end