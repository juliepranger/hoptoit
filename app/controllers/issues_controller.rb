class IssuesController < ApplicationController
	def new
		@issue = Issue.new
	end	

	def create
		@issue = Issue.new(issue_params)
		respond_to do |format|
		if @issue.save
	 		UsersMailer.new_issue_notification(@issue).deliver
	 		format.html { redirect_to issues_url, notice: 'Your Issue Has Been Created!' }
	 		format.json { render action: 'show', status: :created, location: @issue }
		else
			render "new"
		end	
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