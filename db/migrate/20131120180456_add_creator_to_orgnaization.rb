class AddCreatorToOrgnaization < ActiveRecord::Migration
  def change
    add_column :organizations, :creator_id, :integer
    add_column :organizations, :creator_type, :string
  end
end
