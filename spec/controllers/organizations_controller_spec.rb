require 'spec_helper'


describe OrganizationsController do
  render_views
  let(:charity) { FactoryGirl.create :charity_verifier }
  let(:org) { FactoryGirl.create :organization, :charity_verifier => charity }

  it "has a valid factories for org & charity" do
    expect(org).to be_valid
    expect(charity).to be_valid
  end

  it "renders an index page" do
    get :index
    expect(response).to render_template("index")
  end


  it "renders a new page" do
    get :new, id: charity.id
    expect(response).to render_template("new")
  end

  it "assigns the org to @org" do
    get :show, :id => org
    expect(assigns(:org)).to eq(org)
  end


  it "renders a show page" do 
    get :show, :id => org
    expect(response).to render_template("show")
  end

  it "renders an edit page" do
    org = FactoryGirl.create(:organization)
    get :edit, :id => org.id
    expect(response).to render_template("edit")
  end

  it "posts new organizations to the database" do
    current_user = FactoryGirl.create(:user)
    ApplicationController.any_instance.stub(:current_user).and_return(current_user)
    post :create, organization: FactoryGirl.attributes_for(:organization, :charity_verifier_id => charity.id)
    expect{ 
      post :create, organization: FactoryGirl.attributes_for(:organization, :charity_verifier_id => charity.id)
      }.to change(Organization, :count).by(1)
  end

  it "posts updates to the database" do 
      post :update, id: org, organization: {:city => "New Hope City"}
      org.reload
      expect(org.city).to eq("New Hope City")
  end

  it "can destroy a record from the database" do
    org = Organization.create(
      organization_name: "My Data",
      ein: 12345,
      phone: "123456789",
      address: "My Data",
      city: "My Data",
      state: "My Data",
      zipcode: "12345",
      description: "My Data",
      website_url: "My Data"
    )
    post :destroy, id: org.id
    expect(Organization.last).to_not eq(org.id)
  end
end