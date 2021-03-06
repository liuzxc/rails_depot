require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  has_many :favorites
  has_one  :account, :foreign_key => "user_id"

  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  attr_accessible :password, :password_confirmation, :name, :hashed_password,:salt,:admin

  validate :password_must_be_present



  

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end


  def password
    @password
  end

  def password=(password)
	  @password = password

	  if password.present?
	    generate_salt
	    self.hashed_password = self.class.encrypt_password(password, salt)
	  end

  end

  def User.authenticate(name, password)
	  if user = find_by_name(name)
	    if user.hashed_password == encrypt_password(password, user.salt)
	    user
	  end
   end  
  end
  
  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
  
  def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
  end

end
