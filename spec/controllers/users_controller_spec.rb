require 'spec_helper'

describe UsersController do
	before do
		@testuser = User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405')
	end

	describe "GET #index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end
		it "assigns @users" do
			users = User.all
			get :index
			expect(assigns(:users)).to eq(users)
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
			testuser = FactoryGirl.create(:user)
			get :show, id: testuser
			expect(assigns(:user)).to eq(testuser)
		end
		it "renders the :show template" do
			get :show, id: FactoryGirl.create(:user)
			expect(response).to render_template("show")
		end
	end
end