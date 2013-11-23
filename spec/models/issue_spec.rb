require 'spec_helper'

describe Issue do
   before { @issue = Issue.new(
    :title => "My Info",
    :desc => "My Info",
    :funding_goal => 1234567890,
    :pledged_total => 1234567890,
    :num_backers => 1234567890,
    :votes => 400,
    :creator_id => 45,
    :creator_type => "thing",
    :organization_id => 45,
    ) }

  it "saves a new issue to the database" do
    expect(@issue.save).to be_true
  end

  it 'is invalid without a params ' do 
    expect(Issue.create()).to be_invalid
  end 	

  it 'is valid with title and desc filled out' do
  	expect(Issue.create(:title => 'test',:desc => 'test', :funding_goal => '100000')).to be_valid
  end
  it 'is invalid no title ' do
    expect(Issue.create(:title => nil,:desc => 'test', :funding_goal => '100000')).to be_invalid
  end

  it 'is invalid no desc ' do
    expect(Issue.create(:title => 'test',:desc => nil, :funding_goal => '100000')).to be_invalid
  end

  it 'is invalid no funding_goal' do
    expect(Issue.create(:title => 'test',:desc => 'test', :funding_goal => nil)).to be_invalid
  end

end



  