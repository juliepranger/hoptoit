require 'spec_helper'

describe User do
  it 'is invalid without a first name' do
  	expect(User.new(first_name: nil)).to_not be_valid
  end

  # it 'in invalid without a model' do
  # end

  # it 'gets along with FactoryGirl' do
  # end

  # it 'is invalid without a last name' do
  # end

  # it 'is invalid without an email' do
  # end

  # it 'is invalid without an address' do
  # end

  # it 'is invalid without a city' do
  # end

  # it 'is invalid without a zipcode' do
  # end

end
