class User < ActiveRecord::Base
	validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode

  has_many :issues
  has_and_belongs_to_many :organizations

end
