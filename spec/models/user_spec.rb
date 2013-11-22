require 'spec_helper'

describe User do
  before do
    @testuser = User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405', password: "julie", password_confirmation: "julie")
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

  describe 'when password is authenticated' do
      it 'signs in' do
        expect(@testuser.authenticate("julie")).to eq(true)
        end

      it 'does not allow user to sign in' do
        expect(@testuser.authenticate("adam")).to eq(false)
      end
    end

  describe 'when token is generated' do
    it 'generates token' do
      @testuser.generate_token(:password_reset_token)
      expect(@testuser.password_reset_token).to_not eq(nil)
    end
  end
end
