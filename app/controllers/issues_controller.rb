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
		@issue.save
		redirect_to issues_path
	end

	def edit
	
		@issue = Issue.find(params[:id])
	
	end

	def index 
	
		@issues = Issue.all
	end
	
	def update
		@issue = Issue.find(params[:id])
			if @issue.update_attributes(issue_params)
  			redirect_to issues_url
  		else
  			render 'edit'
  			end
  	end
	def show
	
		@user = Issue.find(parmas[:id])	
	end

	def destroy
		Issue.find(params[:id]).destroy
		redirect_to issues_url
	end

	private
	
	def issue_params
    	params.require(:issue).permit(
    		:title, 
    		:desc, 
    		:funding_goal, 
    		:pledged_total, 
    		:num_backers,
    		:funding_date
    		)
  	end
end