require 'spec_helper'

describe User do
  before do
    @testuser = User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405', password: "julie")
    @adminuser = User.create(first_name: 'Adam', last_name: 'Bouck', email: 'adam.j.bouck@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405', admin: "true")
  end

  context 'when creating a User'
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

  # context 'when user logs in'
  #   describe "when password matches confirmation"
  #     it 'signs in' do
        
        
  end
end
