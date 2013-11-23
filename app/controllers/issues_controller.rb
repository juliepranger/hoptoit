class IssuesController < ApplicationController
	skip_before_action :require_login, only:[:show, :index]

	def new
		@issue = Issue.new
		@org = Organization.find(params[:id])
		@issue.organization_id = @org.id
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
		@issue.creator = current_user
		@issue.votes=0
		@issue.pledged_total=0
		@issue.num_backers=0
		@issue.organizations << Organization.find(params[:issue][:organization_id])
		@issue.save
		redirect_to issues_path
	end

	def edit
	
		@issue = Issue.find(params[:id])
	
	end
	def donate
		@issue = Issue.find(params[:id])
		@issue.pledged_total += params[:q].to_i
		@issue.num_backers += 1
		@issue.save
		redirect_to issues_path(@issue)
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
		@issue = Issue.find(params[:id])	
	end

	def destroy
		Issue.find(params[:id]).destroy
		redirect_to issues_url
	end

	def vote
		i = Issue.find(params[:id])
		i.votes +=params[:amount].to_i 
		i.save
		render json: i.votes
		 # respond_to do |format|
		 # 	 	format.html {r}
		 # 		format.js
		 # end
		
		#redirect_to issues_url
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