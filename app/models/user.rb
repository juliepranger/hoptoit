class User < ActiveRecord::Base
	validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  #has_many :issues
  has_and_belongs_to_many :organizations

end
