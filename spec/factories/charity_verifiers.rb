# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charity_verifier do
    ein 123456789
    org_name "Test name"
    street_address "Test Addy"
    city "Test City"
    state "Test State"
    zipcode "test zipcode"
    in_care_of_name "test person"
    subsection_code 123
    classification_code 123
    affiliation_code 123
    deductability_code 123
    foundation_code 123
    eo_status_code 123 
    income_code 123 
    tax_period 123 
    secondary_name "test other name"
    ntee_code "test code"
  end
end
