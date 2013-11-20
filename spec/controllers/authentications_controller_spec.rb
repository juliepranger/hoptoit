require 'spec_helper'

describe AuthenticationsController do 

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
	
end