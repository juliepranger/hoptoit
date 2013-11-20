class AddOrganizationIdToCharityVerifier < ActiveRecord::Migration
  def change
    add_column :charity_verifiers, :organization_id, :integer
  end
end
