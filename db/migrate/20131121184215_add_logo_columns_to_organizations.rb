class AddLogoColumnsToOrganizations < ActiveRecord::Migration
  def up
    add_attachment :organizations, :logo
  end
  def down
    remove_attachment :organizations, :logo
  end
end
