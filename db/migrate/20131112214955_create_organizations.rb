class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string   "organization_name"
      t.integer  "ein"
      t.string   "phone"
      t.string   "address"
      t.string   "city"
      t.string   "state"
      t.string   "zipcode"
      t.text     "description"
      t.string   "website_url"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "in_care_of_name"
      t.integer  :charity_verifier_id

      t.timestamps
    end
  end
end
