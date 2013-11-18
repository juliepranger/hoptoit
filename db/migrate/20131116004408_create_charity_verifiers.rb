class CreateCharityVerifiers < ActiveRecord::Migration
  def change
    create_table :charity_verifiers do |t|
      t.integer :ein
      t.string :org_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :in_care_of_name
      t.integer :subsection_code
      t.integer :classification_code
      t.integer :affiliation_code
      t.integer :deductability_code
      t.integer :foundation_code
      t.integer :eo_status_code
      t.integer :income_code
      t.integer :tax_period
      t.string :secondary_name
      t.string :ntee_code
      # t.resources :organizations

      t.timestamps
    end
  end
end
