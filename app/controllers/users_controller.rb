class UsersController < ApplicationController
	skip_before_action :require_login, only:[:new, :create]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user=User.create(params[:user].permit([:first_name, :last_name, :email, :address, :city, :state, :zipcode, :password, :password_confirmation]))
			if @user.save
			 session[:user_id] = @user.id
			 redirect_to user_url(@user)
			else
			 redirect_to root_path
			end
	end

	def edit
		@user = User.find(params[:id])
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
