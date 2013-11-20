class OrganizationsController < ApplicationController
  skip_before_action :require_login, only:[:show, :index]

  def index
    #list of organizations
    @orgs = Organization.all
  end

  def show
    #info for single organization
    @org = Organization.find(params[:id])
  end

  def new
    #page where new orgs will be created by user
    @org = Organization.new
  end

  def edit
    #restrict access to this page so only org owners/admins can access
    @org = Organization.find(params[:id])
  end

  def create
    #this is probably where verification should take place... need to figure this out.
    @org = Organization.new(org_params)
    # @org.creator = current_user  ##we'll need this to work once we get users / auth up and running
    @org.save
    redirect_to organization_path(@org)
  end

  def destroy
    ##delete the org.
    #need to add some sort of check to make sure only owners/admins of the org can delete the org
    Organization.find(params[:id]).destroy
    redirect_to organizations_path, notice: "Organization deleted."
  end

  def update
    ##update the org's info
    #need to add some sort of check to make sure only owners/admins of the org can modify the org
    @org = Organization.find(params[:id])
    @org.update_attributes(org_params)
    @org.save #do i need thsi with the update_attributes command??
    redirect_to organization_path(@org)
  end

  private

  def org_params
    #permit these fields to be editable.
    params.require(:organization).permit(
      :organization_name,
      :ein,
      :phone,
      :address,
      :city,
      :state,
      :zipcode,
      :description,
      :website_url
    )
  end


end