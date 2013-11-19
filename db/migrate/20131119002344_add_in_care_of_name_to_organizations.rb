class AddInCareOfNameToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :in_care_of_name, :string
  end
end
