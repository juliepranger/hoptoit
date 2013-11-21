class AddCreatorToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :creator_id, :integer
    add_column :issues, :creator_type, :string
  end
end
