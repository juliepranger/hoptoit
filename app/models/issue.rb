class Issue < ActiveRecord::Base
	validates_presence_of :title 
	validates_presence_of :desc

	has_and_belongs_to_many :organizations
	
end