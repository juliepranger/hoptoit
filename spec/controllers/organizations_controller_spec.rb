require 'spec_helper'


describe OrganizationsController do
  it "renders an index page" do
    get :index
    expect(response).to render_template("index")
  end

  it "renders a new page" do
    get :new
    expect(response).to render_template("new")
  end

  it "renders a show page" do 
    org = FactoryGirl.create(:organization)
    get :show, :id => org.id
    expect(response).to render_template("show")
  end

  it "renders an edit page" do
    org = FactoryGirl.create(:organization)
    get :edit, :id => org.id
    expect(response).to render_template("edit")
  end

  it "posts new organizations to the database" do
    org = FactoryGirl.attributes_for(:organization)
    post :create, organization: org
    expect(Organization.last.ein).to eq(org[:ein])
  end

  it "posts updates to the database" do 
    org = Organization.create(
      organization_name: "My Data",
      ein: 00000,
      phone: 00000,
      address: "My Data",
      city: "My Data",
      state: "My Data",
      zipcode: 00000,
      description: "My Data",
      website_url: "My Data"
    )
    post :update, :id => org.id, organization: {:city => "New Hope City"}
    expect(Organization.last.city).to eq("New Hope City")
  end

  it "can destroy a record from the database" do
    org = Organization.create(
      organization_name: "My Data",
      ein: 00000,
      phone: 00000,
      address: "My Data",
      city: "My Data",
      state: "My Data",
      zipcode: 00000,
      description: "My Data",
      website_url: "My Data"
    )
    post :destroy, id: org.id
    expect(Organization.last).to_not eq(org.id)
  end
end