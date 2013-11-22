require 'spec_helper'

describe AuthenticationsController do 
	before do
	@testuser = User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405')
	@adminuser = User.create(first_name: 'Adam', last_name: 'Bouck', email: 'adam.j.bouck@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405', admin: "true")
	end

	it "renders a login page" do
		get :new
		expect(response).to render_template("new")
	end

	it "can destroy a user's session" do
		user = User.create(
			first_name: "My String",
			last_name: "My String",
			email: "My String@mystring.com",
			address: "My Address",
			city: "My City",
			state: "My State",
			zipcode: "My Zipcode",
			password: "My Password"
			)
		post :destroy, id: user.id
		expect(User.last).to_not eq(user.id)
	end

	it 'renders the root after signout' do
		ApplicationController.any_instance.stub(:current_user).and_return(@testuser)
		post :destroy
		expect(response).to redirect_to(root_path)
	end
	
end