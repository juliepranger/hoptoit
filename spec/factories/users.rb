# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    hashed_password "MyString"
    salt "MyString"
  end
end
