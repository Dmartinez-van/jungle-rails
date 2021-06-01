class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates_length_of :password, 
                          presence: true,
                          minimum: 6
  
end
