class Issue < ActiveRecord::Base
	validates_presence_of :title

	validates_presence_of :desc
	validates_presence_of :funding_goal
	validates_presence_of :pledged_total
	validates_presence_of :num_backers
	validates_presence_of :funding_date
	
end