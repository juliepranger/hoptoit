require "spec_helper"

describe UsersMailer do
  describe "new_user_notification" do
    let(:user) { User.create(first_name: 'Julie', last_name: 'Pranger', email: 'juliepranger@gmail.com', address: '1520 2nd St.', city: 'Santa Monica', state: 'CA', zipcode: '90405', password: "julie", password_confirmation: "julie")}
    let(:mail) { UsersMailer.new_user_notification(user) }

    it "sends a welcome email" do
      mail.subject.should eq("Thanks for joining Hop To It!")
      mail.to.should eq([user.email])
      mail.from.should eq(["from@example.com"])
    end
  end

  describe "password_reset" do
    let(:user) { FactoryGirl.create(:user, :password_reset_token => "anything") }
    let(:mail) { UsersMailer.password_reset(user) }

    it "sends user password reset url" do
      mail.subject.should eq("Reset Your Password")
      mail.to.should eq([user.email])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(edit_password_reset_path(user.password_reset_token))
    end
  end
end
