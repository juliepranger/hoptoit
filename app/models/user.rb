require 'bcrypt'

class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation

	before_save :hash_password

	validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email, uniqueness: { case_sensitive: false }
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode

  #has_many :issues
  has_and_belongs_to_many :organizations


  def authenticate(password)
    self.hashed_password ==
    BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password =
      BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end

end
