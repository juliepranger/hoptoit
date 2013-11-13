require 'spec_helper'

describe Issue  do
  it 'is invalid wihtout a title ' do 
    expect(Issue.create()).to be_invalid
  end  
end
