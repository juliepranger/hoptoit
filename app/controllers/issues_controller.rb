class IssuesController < ApplicationController
	def new
		@issue = Issue.new
	end	

	def create_issue_access
		if current_user == :userid
			redirect_to :action => 'show', :id =>@issue._id
		else
			flash[:notice] = "Uh oh, you're not signed in!"
		end
	end

	def create
		@issue = Issue.new(issue_params)
		
		if	@issue.save
			redirect_to issues_path
		else
			render "new"
		end	
	end

	def index 
		@issues = Issue.all
	end
	
	private
	def issue_params
    	params.require(:issue).permit(:title, :desc, :funding_goal, :pledged_total, :num_backers, :funding_date)
  	end
end