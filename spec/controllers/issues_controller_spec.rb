require 'spec_helper'

describe IssuesController do
	before do	
		@testissue = Issue.create(title: 'Sandy', desc: 'this is a hurricane relief')
	end

	describe 'GET #index' do
		it 'renders the index page for issues' do 
			get :index
			expect(response).to render_template("index")
		end

		it "assigns @issues" do
			issues = Issue.all
			get :index
			expect(assigns(:issues)).to eq(issues)
 		end
	end 
	describe "GET #new" do
		it "creates a new form template" do
			get :new
			expect(response).to render_template("new")
		end
		it "creates a new issue" do
			issue = Issue.new
			get :new
			expect(assigns(:issue == issue))
		end
	end 
	describe "get the show template" do
		it "assigns the requested user to @user" do
			testissue = FactoryGirl.create(:issue)
			get :show, id: testissue
			expect(assigns(:issue)).to eq(testissue)
		end
		it "renders the show template" do 
			get :show, id:FactoryGirl.create(:user)
			expect(response).to render_template("show")
		end
	end
end 

# require 'spec_helper'

# describe UsersController do
# 	before do
# 		@testuser = User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405')
# 	end

# 	describe "GET #index" do
# 		it "renders the index template" do
# 			get :index
# 			expect(response).to render_template("index")
# 		end
# 		it "assigns @users" do
# 			users = User.all
# 			get :index
# 			expect(assigns(:users)).to eq(users)
# 		end
# 	end

# 	describe "GET #new" do
# 		it "creates a new form template" do
# 			get :new
# 			expect(response).to render_template("new")
# 		end
# 		it "creates a User.new" do
# 			user = User.new
# 			get :new
# 			expect(assigns(:user == user))
# 		end
# 	end

# 	describe "GET #show" do
# 		it "assigns the requested user to @user" do
# 			testuser = FactoryGirl.create(:user)
# 			get :show, id: testuser
# 			expect(assigns(:user)).to eq(testuser)
# 		end
# 		it "renders the :show template" do
# 			get :show, id: FactoryGirl.create(:user)
# 			expect(response).to render_template("show")
# 		end
# 	end
# end

