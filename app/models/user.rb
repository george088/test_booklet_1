class User < ApplicationRecord
  has_secure_password

  before_validation { 
    (self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase) 
  }

  def is_admin?
    role == 'admin'
  end

end
