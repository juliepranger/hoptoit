require 'spec_helper'

describe Organization do

  describe "model" do
    it "validates the presence of organization_name" do
      expect(Organization.new(:organization_name => nil)).to_not be_valid
    end

    it "validates the presence of ein" do
      expect(Organization.new(:ein => nil)).to_not be_valid
      # expect(Organization.create(:organization)).to be_invalid
    end

  end

end