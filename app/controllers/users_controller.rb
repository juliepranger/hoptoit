class UsersController < ApplicationController
	skip_before_action :require_login, only:[:new, :create]

	def index
		@users = User.all
		unless current_user.admin == "true"
		redirect_to root_path, notice: "Uh oh, you don't have permission to view that!"
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		unless current_user == @user || current_user.admin
			redirect_to users_path, notice: "You can only edit your own profile... jerk"
			#CM- I So Smart
		end
	end

	def create
		@user = User.create(params[:user].permit([:first_name, :last_name, :email, :address, :city, :state, :zipcode, :password, :password_confirmation]))
	  redirect_to users_url
		
		respond_to do |format|
		 	if @user.save
		 		UsersMailer.new_user_notification(@user).deliver
		 		format.html { redirect_to users_url, notice: 'Welcome to Hop To It!' }
		 		format.json { render action: 'show', status: :created, location: @user }
		 	else
		 		format.html { render action: 'new' }
		 		format.json { render json: @user.errors, status: :unprocessable_entity }
		 	end
		end
	end

	def edit
		@user = User.find(params[:id])
		unless current_user == @user
			redirect_to users_path, notice: "You can only edit your own profile... jerk"
			#CM- I So Smart
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user].permit(:first_name, :last_name, :email, :address, :city, :state, :zipcode))
			redirect_to action: 'show', id: @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end
end
