require 'spec_helper'

describe Issue do
   before { @issue = Issue.new(
    :title => "My Info",
    :desc => "My Info",
    :funding_goal => 1234567890,
    :pledged_total => 1234567890,
    :num_backers => 1234567890,
    ) }

  it 'is invalid without a title ' do 
    expect(Issue.create()).to be_invalid
  end 	

  it 'is valid with title and desc filled out' do
  	expect(Issue.create(:title => 'test',:desc => 'test')).to be_valid
  end

end



  