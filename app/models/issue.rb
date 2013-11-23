class Issue < ActiveRecord::Base
	validates_presence_of :title 
	validates_presence_of :desc
	validates_presence_of :funding_goal

	has_and_belongs_to_many :organizations
	belongs_to :creator, polymorphic: true
end