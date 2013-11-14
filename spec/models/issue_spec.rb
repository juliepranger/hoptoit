require 'spec_helper'

describe Issue do

  it 'is invalid without a title ' do 
    expect(Issue.create()).to be_invalid
  end 	

  it 'is valid with title =' do
  	expect(Issue.create(:title => 'test title')).to be_valid
  end
end
