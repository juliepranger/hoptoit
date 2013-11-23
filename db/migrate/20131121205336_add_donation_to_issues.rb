class AddDonationToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :donation, :integer
  end
end
