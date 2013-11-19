require 'bcrypt'

class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation

	before_save :hash_password

	validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

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
