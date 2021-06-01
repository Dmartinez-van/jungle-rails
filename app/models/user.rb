class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_length_of :password, presence: true, minimum: 6

  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    # If the user exists and the password entered is correct
    if @user && @user.authenticate(password)
      @user 
    else
      nil
    end
  end
  
end
