class OrganizationsController < ApplicationController
  respond_to :html, :json

  def index
    #list of organizations
    @orgs = Organization.all
  end

  def show
    #info for single organization
    @org = Organization.find(params[:id])
    #info from the charity verification
    @org_info = @org.charity_verifier
    #import info to define codes in charity+verifier
    @deductability_codes = {
      1 => "Contributions are deductible.",
      2 => "Contributions are not deductible.",
      4 => "Contributions are deductible by treaty (foreign organizations)."
    }
    @income_codes = {
      0 => "0",
      1 => "1   to   9,999",
      2 => "10,000   to   24,999",
      3 => "25,000   to   99,999",
      4 => "100,000   to   499,999",
      5 => "500,000   to   999,999",
      6 => "1,000,000   to   4,999,999",
      7 => "5,000,000   to   9,999,999",
      8 => "10,000,000   to   49,999,999",
      9 => "50,000,000   to   greater"
    }
    @foundation_codes = {
      '00' => "All organizations except 501(c)(3)",
      '02' => "Private operating foundation exempt from paying excise taxes on investment income",
      '03' => "Private operating foundation (other)",
      '04' => "Private non-operating foundation",
      '09' => "Suspense",
      '10' => "Church 170(b)(1)(A)(i)",
      '11' => "School 170(b)(1)(A)(ii)",
      '12' => "Hospital or medical research organization 170(b)(1)(A)(iii)",
      '13' => "Organization which operates for benefit of college or university and is owned or operated by a governmental unit 170(b)(1)(A)(iv)",
      '14' => "Governmental unit 170(b)(1)(A)(v)",
      '15' => "Organization which receives a substantial part of its support from a governmental unit or the general public   170(b)(1)(A)(vi)",
      '16' => "Organization that normally receives no more than one-third of its support from gross investment income and unrelated business income and at the same time more than one-third of its support from contributions, fees, and gross receipts related to exempt purposes.  509(a)(2)",
      '17' => "Organizations operated solely for the benefit of and in conjunction with organizations described in 10 through 16 above.  509(a)(3)",
      '18' => "Organization organized and operated to test for public safety 509(a)(4)",
      '21' => "509(a)(3) Type I",
      '22' => "509(a)(3) Type II",
      '23' => "509(a)(3) Type III functionally integrated",
      '24' => "509(a)(3) Type III not functionally integrated"
    }
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
    #restrict access to this page so only org owners/admins can access
    @org = Organization.find(params[:id])
  end

  def create
    @org = Organization.new(org_params)
    @org.charity_verifier = CharityVerifier.find(params[:organization][:charity_verifier_id])
    # @org.creator = current_user  ##we'll need this to work once we get users / auth up and running
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
      :website_url
    )
  end


end