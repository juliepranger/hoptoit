require 'spec_helper'

describe CharityVerifier do
  let(:charity_verifier) { FactoryGirl.create(:charity_verifier) }

  it "can post a new record to the db" do
    expect(charity_verifier.save).to be_true
  end

end
