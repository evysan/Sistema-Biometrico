class User < ApplicationRecord
  has_many :assistances

  def self.is_admin?(user)
    if user.role == 'admin'
      true
    else
      false
    end
  end
end
