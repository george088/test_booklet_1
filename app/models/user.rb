class User < ApplicationRecord
  has_secure_password

  before_validation { 
    self.username = self.username.to_s.downcase 
  }

  def is_admin?
    role == 'admin'
  end

  def can_modify_user?(user_id)
    role == 'admin' || id.to_s == user_id.to_s
  end
end
