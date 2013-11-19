class UsersController < ApplicationController

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
		@user = User.new(user_params)
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

	private
		def user_params
    	params.require(:user).permit(:first_name, :last_name, :email, :address, :city, :state, :zipcode)
  	end
end
