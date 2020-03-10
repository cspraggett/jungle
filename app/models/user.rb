class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true
  validate :passwordsMatch
  validate :emailUnique
  
  private

  def passwordsMatch 
    if password != password_confirmation 
      errors.add(:password, "passwords don't match")
    end
  end

  def emailUnique 
    @check = User.exists?(["lower(email) = ?", email.downcase.strip])
    if @check == true
      errors.add(:email, "email already exists")
    end
  end

  def authenticate_with_credentials(email, password) 
    @newUser = User.where(email: email)
    if @newUser[0][:password] == password 
      return @newUser
    else 
      return nil
    end
  end
end
