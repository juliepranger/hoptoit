require 'spec_helper'

describe Organization do
  before { @org = Organization.new(
    :organization_name => "My Info",
    :ein => 1234567890,
    :phone => 1234567890,
    :address => "My Info",
    :city => "My Info",
    :state => "My Info",
    :zipcode => 12345,
    :description => "My Info",
    :website_url => "My Info"
    ) }

  describe "model" do
    it "saves a new org to the database" do
      expect(@org.save).to be_true
    end

    it "validates the presence of organization_name" do
      @org.organization_name = nil
      expect(@org.save).to be_false
    end

    it "validates the presence of ein" do
      @org.ein = nil
      expect(@org.save).to be_false
    end

    it "validates the presence of phone" do
      @org.ein = nil
      expect(@org.save).to be_false
    end

    it "validates the presence of address" do
      @org.address = nil
      expect(@org.save).to be_false
    end
    it "validates the presence of city" do
      @org.city = nil
      expect(@org.save).to be_false
    end
    it "validates the presence of state" do
      @org.state = nil
      expect(@org.save).to be_false
    end
    it "validates the presence of zip code" do
      @org.zipcode = nil
      expect(@org.save).to be_false
    end
    it "validates the presence of description" do
      @org.description = nil
      expect(@org.save).to be_false
    end
    it "does not validate the presence of website url" do
      @org.website_url = nil
      expect(@org.save).to be_true
    end
    it "verifies that ein, phone, and zipcode are numbers" do
      @org.ein = "a string"
      @org.phone = "a string"
      @org.zipcode = "a string"
      expect(@org.save).to be_false
    end
  end



end