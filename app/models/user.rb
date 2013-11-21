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

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UsersMailer.password_reset(self).deliver
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
