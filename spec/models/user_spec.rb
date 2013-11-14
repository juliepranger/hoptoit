require 'spec_helper'

describe User do
  it 'is invalid without a first name' do
  	expect(User.new(first_name: nil)).to_not be_valid
  end

  it 'is invalid without a last name' do
  	expect(User.new(last_name: nil)).to_not be_valid
  end

  it 'is invalid without an email' do
  	expect(User.new(email: nil)).to_not be_valid
  end

  it 'is invalid without an address' do
  	expect(User.new(address: nil)).to_not be_valid
  end

  it 'is invalid without a city' do
  	expect(User.new(city: nil)).to_not be_valid
  end

  it 'is invalid without a zipcode' do
  	expect(User.new(zipcode: nil)).to_not be_valid
  end

  it 'is friendly with FactoryGirl' do
		expect(FactoryGirl.create(:user)).to be_valid
	end

end
