require 'spec_helper'

describe UsersController do
	before do
		@testuser = User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405')
		@adminuser = User.create(first_name: 'Adam', last_name: 'Bouck', email: 'adam.j.bouck@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405', admin: "true")
	end

	describe "GET #index" do

		it "renders the root template if not admin" do
		ApplicationController.any_instance.stub(:current_user).and_return(@testuser)
			get :index
			expect(response).to redirect_to(root_path)
		end

		it "renders the index template if admin" do
		ApplicationController.any_instance.stub(:current_user).and_return(@adminuser)
			get :index
			expect(response).to render_template("index")
		end

		it "assigns user to @users" do
			user = User.all
			get :index
			expect(assigns(:users)) == user
		end
	end

	describe "GET #new" do

		it "creates a new form template" do
			get :new
			expect(response).to render_template("new")
		end

		it "creates a User.new" do
			user = User.new
			get :new
			expect(assigns(:user == user))
		end
	end

	describe "GET #show" do

		it "assigns the requested user to @user" do
			ApplicationController.any_instance.stub(:current_user).and_return(@testuser)
			testuser = FactoryGirl.create(:user)
			get :show, id: testuser
			expect(assigns(:user)).to eq(testuser)
		end

		it "if you're the admin, it renders the show" do
		ApplicationController.any_instance.stub(:current_user).and_return(@adminuser)
			get :show, id: FactoryGirl.create(:user)
			expect(response).to render_template("show")
		end

		it "if you're not the admin, it redirects to the users_path" do
		ApplicationController.any_instance.stub(:current_user).and_return(@testuser)
			get :show, id: FactoryGirl.create(:user)
			expect(response).to redirect_to(users_path)
		end
	end
end