class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :organization_name
      t.integer :ein
      t.integer :phone
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :description
      t.string :website_url

      t.timestamps
    end
  end
end
