class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_length_of :password, 
                          presence: true,
                          minimum: 6

  def authenticate_with_credentials(email, password)
    if email == user.authenticate(password).email
      User.new
    else
      nil
    end
  end
  
end
