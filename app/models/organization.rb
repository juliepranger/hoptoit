class Organization < ActiveRecord::Base
  validates :organization_name, presence: true
  validates :ein, presence: true, numericality:true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :description, presence: true
  # validates :website_url, presence: true

  has_one :charity_verifier
  has_and_belongs_to_many :users
end
