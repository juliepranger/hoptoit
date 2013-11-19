class IssuesController < ApplicationController
	def new
		@issue = Issue.new
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
	
		@issue = Issue.find(parmas[:id])	
	end

	def destroy
		Issue.find(params[:id]).destroy
		redirect_to issues_url
	end

	def upvote
		console.log(Issue.votes)
		Issue.votes ++
		console.log(Issue.votes)
	end

	def downvote
		console.log(Issue.votes)
		Issue.votes --
		console.log(Issue.votes)
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