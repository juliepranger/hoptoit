class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = Robot.find(params[:id])
	end

	def create
		 User.create(params[:user].permit([:first_name, :last_name, :email, :address, :city, :state, :zipcode]))
	  redirect_to users_url
	 end
end
