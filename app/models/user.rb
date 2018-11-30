class User < ApplicationRecord
  has_secure_password

  before_validation { 
    self.username = self.username.to_s.downcase 
  }

  def is_admin?
    role == 'admin'
  end

end
