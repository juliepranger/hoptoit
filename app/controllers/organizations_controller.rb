class OrganizationsController < ApplicationController

  respond_to :html, :json

  skip_before_action :require_login, only:[:show, :index]


  def index
    #list of organizations
    @orgs = Organization.all
  end

  def show
    #info for single organization
    @org = Organization.find(params[:id])
    #user can only see edit functions if a manager of that org
    if @org.users.include?(current_user)
      @org_manager = true
    end
    #info from the charity verification
    @org_info = @org.charity_verifier
    @codes = CharityCodes.new
    @ntee = NteeCode.find_by(core_code:@org_info.ntee_code)
  end

  def search
    #use this method to find  a charity, it will pass to new
  end

  def new
    #page where new orgs will be created by user
    #get attributes of charity from the verifier
    @verified_charity = CharityVerifier.find(params[:id])
    @org = Organization.new
    @org.organization_name = @verified_charity.org_name
    @org.ein = @verified_charity.ein
    @org.address = @verified_charity.street_address
    @org.city = @verified_charity.city
    @org.state = @verified_charity.state
    @org.zipcode = @verified_charity.zipcode
    @org.in_care_of_name = @verified_charity.in_care_of_name
    @org.charity_verifier_id = @verified_charity.id
  end

  def edit
    @org = Organization.find(params[:id])
    #restrict access to this page so only org owners/admins can access
    unless @org.users.include?(current_user)
      redirect_to organization_path(@org), notice: "you do not have permission to edit this page."
    end
  end

  def create
    @org = Organization.new(org_params)
    @org.charity_verifier = CharityVerifier.find(params[:organization][:charity_verifier_id])
    @org.creator = current_user  ##we'll need this to work once we get users / auth up and running
    @org.users << current_user
    if @org.save
      respond_with(@org)
    else
      respond_with(@org.errors) {|org| org.html {render "new"}}
    end
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
      :in_care_of_name,
      :address,
      :city,
      :state,
      :zipcode,
      :description,
      :website_url,
      :charity_verifier_id,
      :logo
    )
  end


end