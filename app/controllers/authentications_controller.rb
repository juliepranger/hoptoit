class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]
	skip_before_filter :require_login

	def new
		#are they already logged in?
		if current_user #They are! Can't create them again.
			redirect_to issues_path
		else
			@user = User.new
			render :new
		end
	end

	def form
		@user = User.new
	end

	def create
		user = User.find_by(email: params[:user][:email])
		if user
		# authenticate user
			if user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to issues_path
			else 
				flash[:notice] = "Unable to sign you in."
				render :new
			end
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path,
		notice: "See you again soon!"
	end

end