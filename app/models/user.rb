class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode

  has_many :issues
  has_many :organization_users
	has_many :organizations, through: :organization_users, source: :user_organizations

end
